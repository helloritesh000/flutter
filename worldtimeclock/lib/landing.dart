import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtimeclock/CountryDetail.dart';
import 'package:worldtimeclock/services/world_time_service.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  void setupInitialTime() async {
    WorldTimeService _worldTimeService = WorldTimeService();
    var country = await _worldTimeService.getCountryByName("India");
    Navigator.pushReplacementNamed(context, '/home', arguments: country);
  }

  @override
  void initState() {
    super.initState();
    print("object2");
    setupInitialTime();
  }

  @override
  Widget build(BuildContext context) {
    print("object1");

    return SafeArea(
      child: Container(
        color: Colors.blueAccent,
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
