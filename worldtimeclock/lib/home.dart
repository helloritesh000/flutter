import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:worldtimeclock/CountryDetail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  CountryDetail country = CountryDetail();
  bool isDay = true;

  @override
  Widget build(BuildContext context) {
    print("Called Home");
    country = country.name != null ? country : ModalRoute.of(context).settings.arguments;
    DateTime localTime = DateTime.now().toUtc().add(
        Duration(
            hours: int.parse(country.timezones[0].substring(3, 6)),
            minutes: int.parse('${country.timezones[0].substring(3, 4)}${country.timezones[0].substring(7, 9)}'))
    );
    if(localTime.hour < 4  || localTime.hour > 18)
      isDay = false;
    print(country);
    //country.timezones[0] = "UTC+03:20";
    print(country.timezones[0].substring(3, 6));
    print('${country.timezones[0].substring(3, 4)}${country.timezones[0].substring(7, 9)}');

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/${((isDay)) ? "day.png" : "night.png"}"
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
                'World Time',
                style: TextStyle(
                  fontSize: 22.0
                ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(context, "/location");
                          print(result);
                          if(result != null)
                            {
                              setState(() {
                                country = result;
                              });
                            }
                        },
                        icon: Icon(
                          Icons.edit_location,
                          color: Colors.amber,
                        ),
                        label: Text(
                          "Change Location",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                    )
                  ],
                ),
                Text(
                  country.name,
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
                Text(
                    formatDate(
                        DateTime.now().toUtc().add(
                            Duration(
                                hours: int.parse(country.timezones[0].substring(3, 6)),
                                minutes: int.parse('${country.timezones[0].substring(3, 4)}${country.timezones[0].substring(7, 9)}'))
                        ), [hh, ':', nn, ' ', am]),
                    style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.amber[800]
                    )
                ),
                Text(
                  formatDate(
                      DateTime.now().toUtc().add(
                          Duration(
                              hours: int.parse(country.timezones[0].substring(3, 6)),
                              minutes: int.parse('${country.timezones[0].substring(3, 4)}${country.timezones[0].substring(7, 9)}'))
                      ), [yyyy, '-', mm, '-', dd]),
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
