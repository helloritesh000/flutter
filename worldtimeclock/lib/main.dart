import 'package:flutter/material.dart';
import 'package:worldtimeclock/choose_location.dart';
import 'package:worldtimeclock/home.dart';
import 'package:worldtimeclock/landing.dart';
import 'package:worldtimeclock/test.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      //'/': (context) => Test(),
      '/': (context) => LandingPage(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }
));

