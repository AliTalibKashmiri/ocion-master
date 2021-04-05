import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:ocion/Constants.dart';
import 'package:ocion/components/CustomTextField.dart';
import 'package:ocion/components/customButtons.dart';

class calculateVolume extends StatefulWidget {
  @override
  _calculateVolumeState createState() => new _calculateVolumeState();
}

class _calculateVolumeState extends State<calculateVolume> {

  double volume=0;
  double copConcen=0;
  double resultLiters=0;
  double resultMLiters=0;
  double resultFLitters=0;

  TextEditingController _vController;
  TextEditingController _concController;

  final lCalController = TextEditingController();
  final flCalController = TextEditingController();
  final mlCalController = TextEditingController();

  _printLatestValue() {
    print("Second text field: ${_vController.text}");
  }
  void initState() {
    super.initState();

    _vController = TextEditingController();
    _concController = TextEditingController();
    lCalController.addListener(_printLatestValue);
    flCalController.addListener(_printLatestValue);
    mlCalController.addListener(_printLatestValue);
  }

  void dispose() {
    _vController.dispose();
    _concController.dispose();
    lCalController.dispose();
    flCalController.dispose();
    mlCalController.dispose();
    super.dispose();
  }

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
          title: Text("Home"),
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
                  height: height / 60,
                ),
                Center(
                  child: Image(
                    image: AssetImage("images/logo.png"),
                    height: height / 9,
                  ),
                ),
                SizedBox(
                  height: height / 60,
                ),
                Form(
                    child: Column(
                  children: [

                    Text("OCION BLUE\u{2122}Calculator",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: height/45, color: basicColor),
                      textAlign: TextAlign.center,),
                    SizedBox(
                      height: height / 60,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 12.0, right: 12.0),
                        width: width / 1.1,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff0f2f6),
                        ),
                        //TODO:CATEGORY DROPDOWN
                        child: DropdownButton(
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Text(
                            'Select the OCION product',
                            style: TextStyle(color: Color(0xff8f8f8f)),
                          ), // Not necessary for Option 1
                          value: _selectedProduct,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedProduct = newValue;
                            });
                          },
                          items: _product.map((location) {
                            return DropdownMenuItem(

                              child: Text(location,),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    Center(
                      child: Container(

                        padding: EdgeInsets.only(left: 12.0, right: 12.0),
                        width: width / 1.1,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff0f2f6),
                        ),
                        //TODO:CATEGORY DROPDOWN
                        child: DropdownButton(

                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Text(

                            'Select volume units',
                            style: TextStyle(color: Color(0xff8f8f8f)),
                          ), // Not necessary for Option 1
                          value: _selectedVolumeUnits,

                          onChanged: (newValue) {
                            setState(() {
                              _selectedVolumeUnits = newValue;
                            });
                            volume=double.parse(_vController.text);
                            copConcen=double.parse(_concController.text);
                            if(copConcen<0.85)
                            {
                              if (_selectedVolumeUnits == "LITERS") {
                                lCalController.text = 'Ltr';
                                resultLiters=(volume/10000)*(0.85-copConcen);
                                lCalController.text=resultLiters.toStringAsFixed(2)+" Liters";
                                flCalController.text=(resultLiters*33.8133704).toStringAsFixed(2)+" FL. OZ.";
                                mlCalController.text=(resultLiters*1000).toStringAsFixed(2)+" ml";
                              }
                              else if (_selectedVolumeUnits == "IMP.GALLONS") {
                                resultLiters=((volume/0.21997)/10000)*(0.85-copConcen);
                                lCalController.text=resultLiters.toStringAsFixed(2)+" Ltr";
                                flCalController.text=(resultLiters*33.8133704).toStringAsFixed(2)+" FL. OZ.";
                                mlCalController.text=(resultLiters*1000).toStringAsFixed(2)+" ml";
                              }
                              else if (_selectedVolumeUnits == "US GALLONS") {
                                resultLiters=((volume/0.26417)/10000)*(0.85-copConcen);
                                lCalController.text=resultLiters.toStringAsFixed(2)+" Ltr";
                                flCalController.text=(resultLiters*33.8133704).toStringAsFixed(2)+" FL. OZ.";
                                mlCalController.text=(resultLiters*1000).toStringAsFixed(2)+" ml";
                              }
                            }
                            else
                            {
                              lCalController.text="NO OCION BLUE REQUIRED";
                              mlCalController.text="NO OCION BLUE REQUIRED";
                              flCalController.text="NO OCION BLUE REQUIRED";
                            }
                          },
                          items: _volumeUnits.map((location) {
                            return DropdownMenuItem(
                              child: Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    Center(
                    child:Container(

                      width: width / 1.1,
                      // height: 45.0,

                      child: TextFormField(
                          controller: _vController,
                          decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.1))
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.1))
                              ),

                              contentPadding: EdgeInsets.all(8),

                              hintText: "Enter the volume to be treated"),

                          onChanged:(String value) async {
                            volume=double.parse(_vController.text);
                            copConcen=double.parse(_concController.text);
                            if(copConcen<0.85)
                            {
                              if (_selectedVolumeUnits == "LITERS") {
                                lCalController.text = 'Ltr';
                                resultLiters=(volume/10000)*(0.85-copConcen);
                                lCalController.text=resultLiters.toStringAsFixed(2)+" Ltr";
                                flCalController.text=(resultLiters*33.8133704).toStringAsFixed(2)+" FL. OZ.";
                                mlCalController.text=(resultLiters*1000).toStringAsFixed(2)+" ml";
                              }
                              else if (_selectedVolumeUnits == "IMP.GALLONS") {
                                resultLiters=((volume/0.21997)/10000)*(0.85-copConcen);
                                lCalController.text=resultLiters.toStringAsFixed(2)+" Ltr";
                                flCalController.text=(resultLiters*33.8133704).toStringAsFixed(2)+" FL. OZ.";
                                mlCalController.text=(resultLiters*1000).toStringAsFixed(2)+" ml";
                              }
                              else if (_selectedVolumeUnits == "US GALLONS") {
                                resultLiters=((volume/0.26417)/10000)*(0.85-copConcen);
                                lCalController.text=resultLiters.toStringAsFixed(2)+" Ltr";
                                flCalController.text=(resultLiters*33.8133704).toStringAsFixed(2)+" FL. OZ.";
                                mlCalController.text=(resultLiters*1000).toStringAsFixed(2)+" ml";
                              }
                            }
                            else
                              {
                                lCalController.text="NO OCION BLUE REQUIRED";
                                mlCalController.text="NO OCION BLUE REQUIRED";
                                flCalController.text="NO OCION BLUE REQUIRED";
                              }

                          },
                          obscureText: false,
                          keyboardType: TextInputType.number
                      ),
                    ),
                    ),
                  ],
                )),
                SizedBox(
                  height: height / 60,
                ),
                Center(
                  child:Container(
                  width: width / 1.1,
                  // height: 45.0,
                    child: TextFormField(
                    controller: _concController,
                    decoration: new InputDecoration(


                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black.withOpacity(0.1))
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black.withOpacity(0.1))
                        ),
                        contentPadding: EdgeInsets.all(8),
                        hintText: "Enter the measure copper concentration"
                    ),
                    onChanged:(String value) async {

                      volume=double.parse(_vController.text);
                      copConcen=double.parse(_concController.text);
                      if(copConcen<0.85)
                      {
                        if (_selectedVolumeUnits == "LITERS") {
                          lCalController.text = 'Ltr';
                          resultLiters=(volume/10000)*(0.85-copConcen);
                          lCalController.text=resultLiters.toStringAsFixed(2)+" Ltr";
                          flCalController.text=(resultLiters*33.8133704).toStringAsFixed(2)+" FL. OZ.";
                          mlCalController.text=(resultLiters*1000).toStringAsFixed(2)+" ml";
                        }
                        else if (_selectedVolumeUnits == "IMP.GALLONS") {
                          resultLiters=((volume/0.21997)/10000)*(0.85-copConcen);
                          lCalController.text=resultLiters.toStringAsFixed(2)+" Ltr";
                          flCalController.text=(resultLiters*33.8133704).toStringAsFixed(2)+" FL. OZ.";
                          mlCalController.text=(resultLiters*1000).toStringAsFixed(2)+" ml";
                        }
                        else if (_selectedVolumeUnits == "US GALLONS") {
                          resultLiters=((volume/0.26417)/10000)*(0.85-copConcen);
                          lCalController.text=resultLiters.toStringAsFixed(2)+" Ltr";
                          flCalController.text=(resultLiters*33.8133704).toStringAsFixed(2)+" FL. OZ.";
                          mlCalController.text=(resultLiters*1000).toStringAsFixed(2)+" ml";
                        }
                      }
                      else
                      {
                        lCalController.text="NO OCION BLUE REQUIRED";
                        mlCalController.text="NO OCION BLUE REQUIRED";
                        flCalController.text="NO OCION BLUE REQUIRED";
                      }


                    },
                    obscureText: false,
                    keyboardType: TextInputType.number
                ),
                ),
                ),
                SizedBox(
                  height: height / 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Answer : ',
                            style: TextStyle(
                                color: Color(0xff324980),
                                fontWeight: FontWeight.bold,
                                fontSize: height / 40)),
                        TextSpan(
                          text: 'Product Volume Required',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: height / 50),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: TextField(
                          controller: lCalController,
                          enabled: false,
                        ),),
                      Center(
                        child: TextField(
                          controller: flCalController,
                          enabled: false,
                        ),
                      ),

                      Center(
                        child: TextField(
                          controller: mlCalController,
                          enabled: false,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      resetButton(
                        text: Text("Reset",
                        ),
                        onPressed: (){
                          lCalController.text="";
                          mlCalController.text="";
                          flCalController.text="";
                          _vController.text="";
                          _concController.text="";
                          // Navigator.pushNamed(context, "/CalculateVolume");
                        },
                        // focusColor: Colors.red,
                        // disbaleColor: Colors.black,
                      ),
                      volumeCalculate(
                        text: Text("Calculate Volume",
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, "/SelectOption");
                        },
                        // focusColor: Colors.red,
                        // disbaleColor: Colors.black,
                      ),
                    ],),
                  ),
                ),
                SizedBox(
                  height: height / 60,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 12.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         'Volume Calculate',
                //         style: TextStyle(
                //             color: Color(0xff324980),
                //             fontWeight: FontWeight.bold,
                //             fontSize: height / 40),
                //       ),
                //      SizedBox(width: width/25,),
                //
                //       Center(
                //         child: walkthroghButton(
                //             iconss: Icon(Icons.arrow_forward,color: Colors.white,),
                //             colorss: Colors.black,
                //             focusColor: backgroundColor,
                //             disbaleColor: Colors.blue,
                //             onPressed: () =>
                //                 Navigator.pushNamed(context, "/EllipticalShape")
                //
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                // Image(
                //   image: AssetImage("images/bottomAnimation.png"),
                //   height: height / 4,
                //   fit: BoxFit.fill,
                //   // width: width/0.8,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> _product = ['OCION BLUE\u{2122}', ]; //
String _selectedProduct;
List<String> _volumeUnits = ['LITERS', 'IMP.GALLONS' ,'US GALLONS' ]; //
String _selectedVolumeUnits;
