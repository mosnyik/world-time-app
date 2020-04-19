import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';

void main() => runApp(MaterialApp(

  // navigation routes in the application

  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/location' : (context) => ChooseLocation(),
    '/home' : (context) => Home(),
  },
));

