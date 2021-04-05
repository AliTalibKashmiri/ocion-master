import 'package:flutter/material.dart';
import 'package:ocion/Screens/calculateVolume.dart';
import 'package:ocion/Screens/ellipticalShape.dart';
import 'package:ocion/Screens/rectanglePoolShape.dart';
import 'package:ocion/Screens/selectOption.dart';
import 'package:ocion/Screens/splash.dart';
import 'package:ocion/Screens/welcomeScreen.dart';


void main() {
  runApp(MyApp());
}

var routes = <String, WidgetBuilder>{
  "/WelcomeScreen": (BuildContext context) => welcomeScreen(),
  "/CalculateVolume": (BuildContext context) => calculateVolume(),
  "/EllipticalShape": (BuildContext context) => ellipticalShape(),
  "/RectanglePoolShape": (BuildContext context) => rectanglePoolShape(),
  "/SelectOption": (BuildContext context) => selectOption(),

};



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'workSans',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: splashScreen(),
      routes: routes,
    );
  }
}

