import 'package:flutter/material.dart';
import 'package:ocion/Constants.dart';
import 'package:ocion/components/CustomTextField.dart';
import 'package:ocion/components/customButtons.dart';

class selectOption extends StatefulWidget {
  @override
  _selectOptionState createState() => new _selectOptionState();
}

class _selectOptionState extends State<selectOption> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String volumeInLiters = '6545 L';

    String volumeInGallons = '56685 gal';
    return SafeArea(

      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: basicColor,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text("Volume Calculator"),
          centerTitle: true,
        ),
        // appBar: customAppBar1("Sign In"),

        body: SingleChildScrollView(
          child: Container(
            // color: whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height / 50,
                ),
                Center(
                  child: Image(
                    image: AssetImage("images/logo.png"),
                    height: height / 10,
                  ),
                ),
                SizedBox(
                  height: height / 60,
                ),
                Center(
                    child: Text(
                  'RESERVOIR VOLUME CALCULATOR',
                  style: TextStyle(
                      color: basicColor,
                      fontSize: height / 50,
                      fontWeight: FontWeight.w500),
                )),
                SizedBox(
                  height: height / 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/EllipticalShape");
                    },
                    child: Image(
                      image: AssetImage("images/ellipticalShape.png"),
                      height: height / 5.5,
                      // width: width/1.8,
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/RectanglePoolShape");
                    },
                    child: Image(
                      image: AssetImage("images/poolShape.png"),
                      height: height / 5.5,
                      // width: width/1.8,
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 15,
                ),
                Center(
                  child: homeButton(
                    text: Text(
                      "Home",
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/CalculateVolume");
                    },
                    // focusColor: Colors.red,
                    // disbaleColor: Colors.black,
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
