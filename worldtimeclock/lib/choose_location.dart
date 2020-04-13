import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worldtimeclock/CountryDetail.dart';
import 'package:worldtimeclock/services/world_time_service.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<CountryDetail> countries = List<CountryDetail>();
  WorldTimeService _worldTimeService = WorldTimeService();
  void getCountries() async {
    if(countries.length == 0)
      countries = await _worldTimeService.getCountries();
    setState(() {});
    print(countries.length);
  }

  @override
  void initState() {
    super.initState();
    print("Location 2 Called");
    getCountries();
  }

  @override
  Widget build(BuildContext context) {
    print("Location 1 Called");
    return SafeArea(
      child: Container(
        color: Colors.blueAccent,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Choose Location",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () async {
                    print (countries[index].name);
                    var country = await _worldTimeService.getCountryByName(countries[index].name);
                    Navigator.pop(context, country);
                  },
                  title: Text('${countries[index].name} (${countries[index].capital})', style: TextStyle(fontSize: 20.0),),
                  leading: SvgPicture.network(
                        countries[index].flag,
                        height: 22.0,
                        width: 22.0,
                        fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
