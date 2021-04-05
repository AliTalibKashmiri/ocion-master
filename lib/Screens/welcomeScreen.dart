import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:ocion/Constants.dart';
import 'package:ocion/components/customButtons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants.dart';

class welcomeScreen extends StatefulWidget {
  @override
  _welcomeScreenState createState() => new _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {

  int $trade = 0x2122;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: basicColor,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text("Welcome"),
          centerTitle: true,
        ),


        body: SingleChildScrollView(
          child: Container(
            // color: whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height/50,),
                Center(
                  child: Image(
                    image: AssetImage("images/logo.png"),
                    height: height / 6,
                  ),
                ),


                Text("Welcome To OCION BLUE\u{2122}Calculator",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: height/45, color: basicColor),
                textAlign: TextAlign.center,),


                Center(
                  child: InkWell(
                    onTap: () {
                      _launchURL();
                      // Navigator.pushNamed(context, "/forgotPassword");
                    },
                    child: Text(
                      'www.ocionblue.com',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: height / 60),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: height / 80,
                // ),
                Center(
                  child: Image(
                    image: AssetImage("images/welcomePic.png"),
                    height: height / 2.7,
                  // width: width/0.9,
                    fit: BoxFit.contain,
                  ),
                ),

    // SizedBox(
    // height: height / 50,
    // ),
    //             walkthroghButton(
    //               iconss: Icon(Icons.arrow_forward,color: Colors.white,),
    //               colorss: Colors.black,
    //               focusColor: backgroundColor,
    //               disbaleColor: Colors.blue,
    //               onPressed: () =>
    //                    Navigator.pushNamed(context, "/CalculateVolume")
    //
    //             ),

                SizedBox(height: height/60,),
                CustomButton1(
                  text: Text("Next",
                     ),
                  onPressed: (){
                    Navigator.pushNamed(context, "/CalculateVolume");
                  },
                  // focusColor: Colors.red,
                  // disbaleColor: Colors.black,
                ),
                SizedBox(height: height/25,),
                Center(child: Text('Follow us on', style: TextStyle(color: basicColor, fontSize: height/50, fontWeight: FontWeight.w500),)),

                Center(
                  child: Container(
                    width: width / 4.5,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        GestureDetector(
                          onTap: _launchURLInsta,
                          child: Image.asset(
                            'images/insta.jpg', // On click should redirect to an URL
                            height: height / 12,
                            width: width / 10,
                          ),
                        ),

                        GestureDetector(
                          onTap: _launchURLTwt,
                          child: Image.asset(
                            'images/twitter.png', // On click should redirect to an URL
                            height: height / 12,
                            width: width / 10,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );

  }
  _launchURL() async {
    const url = 'http://www.ocionblue.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLInsta() async {
    const url = 'https://www.instagram.com/ocionblue/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLTwt() async {
    const url = 'https://twitter.com/OcionBlue';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
