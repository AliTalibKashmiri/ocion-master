import 'dart:async';

import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {


  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, "/WelcomeScreen"));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white,
          // image: DecorationImage(
          //   image: AssetImage("assets/images/background.png"),
          //   fit: BoxFit.cover,
          //   colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
          // )
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Center(
              child: Image(
                image:  AssetImage("images/logo.png"),
                height: height/5,

              ),
            ),

              // Image(
              //   image:  AssetImage("images/bottomAnimation.png"),
              //   height: height/4,
              //  fit: BoxFit.fill,
              //  // width: width/0.8,
              //
              // ),
          ],)
        ),
      ),
    );
  }
}
