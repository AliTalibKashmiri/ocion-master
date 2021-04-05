import 'package:flutter/material.dart';
import 'package:ocion/Constants.dart';
import 'package:ocion/components/CustomTextField.dart';
import 'package:ocion/components/customButtons.dart';

class ellipticalShape extends StatefulWidget {
  @override
  _ellipticalShapeState createState() => new _ellipticalShapeState();
}

class _ellipticalShapeState extends State<ellipticalShape> {

  TextEditingController _wController1;

  TextEditingController _wController2;
  TextEditingController _wController3;
  TextEditingController _lController1;
  TextEditingController _lController2;
  TextEditingController _lController3;
  TextEditingController _dController1;
  TextEditingController _dController2;
  TextEditingController _dController3;
  double finalLiters=0;

  double fLength=0;
  double fWidth=0;
  double fDepth=0;
  double fConv=28.316846592;
  double fVolume=0;
  double fLiters=0;


  double yLength=0;
  double yWidth=0;
  double yDepth=0;
  double yConv=764.55;
  double yVolume=0;
  double yLiters=0;


  double mLength=0;
  double mWidth=0;
  double mDepth=0;
  double mConv= 1000;
  double mVolume=0;
  double mLiters=0;




  final calcLController = TextEditingController();
  final galCalcLController = TextEditingController();
  _printLatestValue() {
    print("Second text field: ${calcLController.text}");
  }
  @override
  void initState() {
    super.initState();

    _wController1 = TextEditingController();
    //_wController1.text='0';
    _wController2 = TextEditingController();
    //_wController2.text ='0';
    _wController3 = TextEditingController();
    //_wController3.text ='0';
    _lController1 = TextEditingController();
    //_lController1.text ='0';
    _lController2 = TextEditingController();
    //_lController2.text ='0';
    _lController3 = TextEditingController();
    //_lController3.text ='0';
    _dController1 = TextEditingController();
    //_dController1.text ='0';
    _dController2 = TextEditingController();
    //_dController2.text ='0';
    _dController3 = TextEditingController();
    //_dController3.text ='0';
    calcLController.addListener(_printLatestValue);
    galCalcLController.addListener(_printLatestValue);
  }

  @override
  void dispose() {

    _wController1.dispose();
    _wController2.dispose();
    _wController3.dispose();
    _lController1.dispose();
    _lController2.dispose();
    _lController3.dispose();
    _dController1.dispose();
    _dController2.dispose();
    _dController3.dispose();
    calcLController.dispose();
    galCalcLController.dispose();
    super.dispose();
  }




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
          title: Text("Round or Elliptical Pond", style: TextStyle(fontSize: height/50),),
          centerTitle: true,
        ),


        body: SingleChildScrollView(
          child: Container(
            // color: whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height / 40,
                ),

                Center(
                  child: Text(
                    'Calculate the pool and spa water',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: height / 60),
                  ),
                ),
                SizedBox(
                  height: height / 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Image(
                    image: AssetImage("images/ellipticalShape.png"),
                    height: height / 4.8,
                    // width: width/1.8,
                  ),
                ),
                SizedBox(
                  height: height / 60,
                ),
                Center(
                  child: Container(
                    width: width / 1.2,
                    child: Center(
                      child: Text(
                        'Enter parameters below for your selected units ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: height / 50),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: width / 1.1,
                    child: DataTable(
                      showBottomBorder: false,

                      columnSpacing: 2.0,
                      horizontalMargin: 3.0,
                      // showBottomBorder: false,
                      //showCheckboxColumn: true,
                      //sortAscending: true,
                      columns: [
                        // DataColumn(label: Text(
                        //     'gfgfg',
                        //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey)
                        // )),
                        DataColumn(
                            label: Text(
                              '',
                            )),
                        DataColumn(
                            label: Text('Feet',
                                style: TextStyle(
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey))),
                        DataColumn(
                            label: Text('Yard',
                                style: TextStyle(
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey))),
                        DataColumn(
                            label: Text('Meters',
                                style: TextStyle(
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey))),
                      ],
                      rows: [
                        // DataRow(
                        //
                        //   cells: [
                        //
                        //
                        //     DataCell(TextFormField(
                        //
                        //     )),
                        //     DataCell(TextFormField()),
                        //     DataCell(TextFormField()),
                        //   ],),
                        DataRow(
                          cells: [
                            DataCell(Text('Length',
                                style: TextStyle(
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey))),
                            DataCell(
                              TextField(
                                  controller: _lController1,
                                  onChanged:(String value) async {
                                    fLength=double.parse(value);
                                  //feet
                                    if(_wController1.text=="")
                                      {
                                        fWidth=0;

                                      }
                                    else
                                      {
                                        fWidth=double.parse(_wController1.text);
                                      }
                                    if(_lController1.text=="")
                                      {

                                        fLength=0;
                                      }
                                    else
                                      {
                                        fLength=double.parse(_lController1.text);
                                      }

                                    if(_dController1.text=="")
                                    {

                                      fDepth=0;
                                    }
                                    else
                                    {
                                      fDepth=double.parse(_dController1.text);
                                    }






                                    if( _wController2.text=="")
                                    {
                                      yWidth=0;

                                    }
                                    else
                                    {
                                      yWidth=double.parse(_wController2.text);

                                    }
                                    if(_lController2.text=="")
                                    {

                                      yLength=0;
                                    }
                                    else
                                    {
                                      yLength=double.parse( _lController2.text);
                                    }

                                    if(_dController2.text=="")
                                    {

                                      yDepth=0;
                                    }
                                    else
                                    {
                                      yDepth=double.parse(_dController2.text);
                                    }







                                    if( _wController3.text=="")
                                    {
                                      mWidth=0;

                                    }
                                    else
                                    {
                                      mWidth=double.parse(_wController3.text);

                                    }
                                    if(_lController3.text=="")
                                    {

                                      mLength=0;
                                    }
                                    else
                                    {
                                      mLength=double.parse(_lController3.text);

                                    }

                                    if(_dController3.text=="")
                                    {

                                      mDepth=0;
                                    }
                                    else
                                    {
                                      mDepth=double.parse(_dController3.text);
                                    }










                                    fVolume=(fLength/2)*(fWidth/2)*fDepth;
                                    yVolume=(yLength/2)*(yWidth/2)*yDepth;
                                    mVolume=(mLength/2)*(mWidth/2)*mDepth;


                                    fLiters=fVolume*fConv;
                                    yLiters=yVolume*yConv;
                                    mLiters=mVolume*mConv;




                                    finalLiters=fLiters+yLiters+mLiters;

                                    calcLController.text=(finalLiters).toStringAsFixed(2)+" Ltr";
                                    galCalcLController.text=(finalLiters*0.264172052).toStringAsFixed(2)+" US Gal";
                                  },
                                  keyboardType: TextInputType.number
                              ),
                            ),
                            DataCell(
                              TextField(
                                  controller: _lController2,

                                  onChanged:(String value) async {

                                    if(_wController1.text=="")
                                    {
                                      fWidth=0;

                                    }
                                    else
                                    {
                                      fWidth=double.parse(_wController1.text);
                                    }
                                    if(_lController1.text=="")
                                    {

                                      fLength=0;
                                    }
                                    else
                                    {
                                      fLength=double.parse(_lController1.text);
                                    }

                                    if(_dController1.text=="")
                                    {

                                      fDepth=0;
                                    }
                                    else
                                    {
                                      fDepth=double.parse(_dController1.text);
                                    }






                                    if( _wController2.text=="")
                                    {
                                      yWidth=0;

                                    }
                                    else
                                    {
                                      yWidth=double.parse(_wController2.text);

                                    }
                                    if(_lController2.text=="")
                                    {

                                      yLength=0;
                                    }
                                    else
                                    {
                                      yLength=double.parse( _lController2.text);
                                    }

                                    if(_dController2.text=="")
                                    {

                                      yDepth=0;
                                    }
                                    else
                                    {
                                      yDepth=double.parse(_dController2.text);
                                    }







                                    if( _wController3.text=="")
                                    {
                                      mWidth=0;

                                    }
                                    else
                                    {
                                      mWidth=double.parse(_wController3.text);

                                    }
                                    if(_lController3.text=="")
                                    {

                                      mLength=0;
                                    }
                                    else
                                    {
                                      mLength=double.parse(_lController3.text);

                                    }

                                    if(_dController3.text=="")
                                    {

                                      mDepth=0;
                                    }
                                    else
                                    {
                                      mDepth=double.parse(_dController3.text);
                                    }


                                    fVolume=(fLength/2)*(fWidth/2)*fDepth;
                                    yVolume=(yLength/2)*(yWidth/2)*yDepth;
                                    mVolume=(mLength/2)*(mWidth/2)*mDepth;

                                    fLiters=fVolume*fConv;
                                    yLiters=yVolume*yConv;
                                    mLiters=mVolume*mConv;




                                    finalLiters=fLiters+yLiters+mLiters;
                                    calcLController.text=(finalLiters).toStringAsFixed(2)+" Ltr";
                                    galCalcLController.text=(finalLiters*0.264172052).toStringAsFixed(2)+" US Gal";
                                  },
                                  keyboardType: TextInputType.number
                              ),
                            ),
                            DataCell(
                              TextField(
                                  controller: _lController3,
                                  onChanged:(String value) async {

                                    if(_wController1.text=="")
                                    {
                                      fWidth=0;

                                    }
                                    else
                                    {
                                      fWidth=double.parse(_wController1.text);
                                    }
                                    if(_lController1.text=="")
                                    {

                                      fLength=0;
                                    }
                                    else
                                    {
                                      fLength=double.parse(_lController1.text);
                                    }

                                    if(_dController1.text=="")
                                    {

                                      fDepth=0;
                                    }
                                    else
                                    {
                                      fDepth=double.parse(_dController1.text);
                                    }






                                    if( _wController2.text=="")
                                    {
                                      yWidth=0;

                                    }
                                    else
                                    {
                                      yWidth=double.parse(_wController2.text);

                                    }
                                    if(_lController2.text=="")
                                    {

                                      yLength=0;
                                    }
                                    else
                                    {
                                      yLength=double.parse( _lController2.text);
                                    }

                                    if(_dController2.text=="")
                                    {

                                      yDepth=0;
                                    }
                                    else
                                    {
                                      yDepth=double.parse(_dController2.text);
                                    }







                                    if( _wController3.text=="")
                                    {
                                      mWidth=0;

                                    }
                                    else
                                    {
                                      mWidth=double.parse(_wController3.text);

                                    }
                                    if(_lController3.text=="")
                                    {

                                      mLength=0;
                                    }
                                    else
                                    {
                                      mLength=double.parse(_lController3.text);

                                    }

                                    if(_dController3.text=="")
                                    {

                                      mDepth=0;
                                    }
                                    else
                                    {
                                      mDepth=double.parse(_dController3.text);
                                    }


                                    fVolume=(fLength/2)*(fWidth/2)*fDepth;
                                    yVolume=(yLength/2)*(yWidth/2)*yDepth;
                                    mVolume=(mLength/2)*(mWidth/2)*mDepth;

                                    fLiters=fVolume*fConv;
                                    yLiters=yVolume*yConv;
                                    mLiters=mVolume*mConv;




                                    finalLiters=fLiters+yLiters+mLiters;
                                    calcLController.text=(finalLiters).toStringAsFixed(2)+" Ltr";
                                    galCalcLController.text=(finalLiters*0.264172052).toStringAsFixed(2)+" US Gal";
                                  },
                                  keyboardType: TextInputType.number
                              ),
                            ),
                          ],
                        ),
                        DataRow(cells: [
                          DataCell(Text('Width',
                              style: TextStyle(
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey))),
                          DataCell(
                            TextField(
                                controller: _wController1,
                                onChanged:(String value) async {



                                  if(_wController1.text=="")
                                  {
                                    fWidth=0;

                                  }
                                  else
                                  {
                                    fWidth=double.parse(_wController1.text);
                                  }
                                  if(_lController1.text=="")
                                  {

                                    fLength=0;
                                  }
                                  else
                                  {
                                    fLength=double.parse(_lController1.text);
                                  }

                                  if(_dController1.text=="")
                                  {

                                    fDepth=0;
                                  }
                                  else
                                  {
                                    fDepth=double.parse(_dController1.text);
                                  }






                                  if( _wController2.text=="")
                                  {
                                    yWidth=0;

                                  }
                                  else
                                  {
                                    yWidth=double.parse(_wController2.text);

                                  }
                                  if(_lController2.text=="")
                                  {

                                    yLength=0;
                                  }
                                  else
                                  {
                                    yLength=double.parse( _lController2.text);
                                  }

                                  if(_dController2.text=="")
                                  {

                                    yDepth=0;
                                  }
                                  else
                                  {
                                    yDepth=double.parse(_dController2.text);
                                  }







                                  if( _wController3.text=="")
                                  {
                                    mWidth=0;

                                  }
                                  else
                                  {
                                    mWidth=double.parse(_wController3.text);

                                  }
                                  if(_lController3.text=="")
                                  {

                                    mLength=0;
                                  }
                                  else
                                  {
                                    mLength=double.parse(_lController3.text);

                                  }

                                  if(_dController3.text=="")
                                  {

                                    mDepth=0;
                                  }
                                  else
                                  {
                                    mDepth=double.parse(_dController3.text);
                                  }




                                  fVolume=(fLength/2)*(fWidth/2)*fDepth;
                                  yVolume=(yLength/2)*(yWidth/2)*yDepth;
                                  mVolume=(mLength/2)*(mWidth/2)*mDepth;

                                  fLiters=fVolume*fConv;
                                  yLiters=yVolume*yConv;
                                  mLiters=mVolume*mConv;




                                  finalLiters=fLiters+yLiters+mLiters;
                                  calcLController.text=(finalLiters).toStringAsFixed(2)+" Ltr";
                                  galCalcLController.text=(finalLiters*0.264172052).toStringAsFixed(2)+" US Gal";
                                },
                                keyboardType: TextInputType.number
                            ),
                          ),
                          DataCell(
                            TextField(
                                controller: _wController2,
                                onChanged:(String value) async {


                                  if(_wController1.text=="")
                                  {
                                    fWidth=0;

                                  }
                                  else
                                  {
                                    fWidth=double.parse(_wController1.text);
                                  }
                                  if(_lController1.text=="")
                                  {

                                    fLength=0;
                                  }
                                  else
                                  {
                                    fLength=double.parse(_lController1.text);
                                  }

                                  if(_dController1.text=="")
                                  {

                                    fDepth=0;
                                  }
                                  else
                                  {
                                    fDepth=double.parse(_dController1.text);
                                  }






                                  if( _wController2.text=="")
                                  {
                                    yWidth=0;

                                  }
                                  else
                                  {
                                    yWidth=double.parse(_wController2.text);

                                  }
                                  if(_lController2.text=="")
                                  {

                                    yLength=0;
                                  }
                                  else
                                  {
                                    yLength=double.parse( _lController2.text);
                                  }

                                  if(_dController2.text=="")
                                  {

                                    yDepth=0;
                                  }
                                  else
                                  {
                                    yDepth=double.parse(_dController2.text);
                                  }







                                  if( _wController3.text=="")
                                  {
                                    mWidth=0;

                                  }
                                  else
                                  {
                                    mWidth=double.parse(_wController3.text);

                                  }
                                  if(_lController3.text=="")
                                  {

                                    mLength=0;
                                  }
                                  else
                                  {
                                    mLength=double.parse(_lController3.text);

                                  }

                                  if(_dController3.text=="")
                                  {

                                    mDepth=0;
                                  }
                                  else
                                  {
                                    mDepth=double.parse(_dController3.text);
                                  }






                                  fVolume=(fLength/2)*(fWidth/2)*fDepth;
                                  yVolume=(yLength/2)*(yWidth/2)*yDepth;
                                  mVolume=(mLength/2)*(mWidth/2)*mDepth;

                                  fLiters=fVolume*fConv;
                                  yLiters=yVolume*yConv;
                                  mLiters=mVolume*mConv;




                                  finalLiters=fLiters+yLiters+mLiters;
                                  calcLController.text=(finalLiters).toStringAsFixed(2)+" Ltr";
                                  galCalcLController.text=(finalLiters*0.264172052).toStringAsFixed(2)+" US Gal";
                                },
                                keyboardType: TextInputType.number
                            ),
                          ),
                          DataCell(
                            TextField(
                                controller: _wController3,
                                onChanged:(String value) async {

                                  if(_wController1.text=="")
                                  {
                                    fWidth=0;

                                  }
                                  else
                                  {
                                    fWidth=double.parse(_wController1.text);
                                  }
                                  if(_lController1.text=="")
                                  {

                                    fLength=0;
                                  }
                                  else
                                  {
                                    fLength=double.parse(_lController1.text);
                                  }

                                  if(_dController1.text=="")
                                  {

                                    fDepth=0;
                                  }
                                  else
                                  {
                                    fDepth=double.parse(_dController1.text);
                                  }






                                  if( _wController2.text=="")
                                  {
                                    yWidth=0;

                                  }
                                  else
                                  {
                                    yWidth=double.parse(_wController2.text);

                                  }
                                  if(_lController2.text=="")
                                  {

                                    yLength=0;
                                  }
                                  else
                                  {
                                    yLength=double.parse( _lController2.text);
                                  }

                                  if(_dController2.text=="")
                                  {

                                    yDepth=0;
                                  }
                                  else
                                  {
                                    yDepth=double.parse(_dController2.text);
                                  }







                                  if( _wController3.text=="")
                                  {
                                    mWidth=0;

                                  }
                                  else
                                  {
                                    mWidth=double.parse(_wController3.text);

                                  }
                                  if(_lController3.text=="")
                                  {

                                    mLength=0;
                                  }
                                  else
                                  {
                                    mLength=double.parse(_lController3.text);

                                  }

                                  if(_dController3.text=="")
                                  {

                                    mDepth=0;
                                  }
                                  else
                                  {
                                    mDepth=double.parse(_dController3.text);
                                  }







                                  fVolume=(fLength/2)*(fWidth/2)*fDepth;
                                  yVolume=(yLength/2)*(yWidth/2)*yDepth;
                                  mVolume=(mLength/2)*(mWidth/2)*mDepth;

                                  fLiters=fVolume*fConv;
                                  yLiters=yVolume*yConv;
                                  mLiters=mVolume*mConv;




                                  finalLiters=fLiters+yLiters+mLiters;
                                  calcLController.text=(finalLiters).toStringAsFixed(2)+" Ltr";
                                  galCalcLController.text=(finalLiters*0.264172052).toStringAsFixed(2)+" US Gal";
                                },
                                keyboardType: TextInputType.number
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Depth',
                              style: TextStyle(
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey))),
                          DataCell(
                            TextField(
                                controller: _dController1,
                                onChanged:(String value) async {


                                  if(_wController1.text=="")
                                  {
                                    fWidth=0;

                                  }
                                  else
                                  {
                                    fWidth=double.parse(_wController1.text);
                                  }
                                  if(_lController1.text=="")
                                  {

                                    fLength=0;
                                  }
                                  else
                                  {
                                    fLength=double.parse(_lController1.text);
                                  }

                                  if(_dController1.text=="")
                                  {

                                    fDepth=0;
                                  }
                                  else
                                  {
                                    fDepth=double.parse(_dController1.text);
                                  }






                                  if( _wController2.text=="")
                                  {
                                    yWidth=0;

                                  }
                                  else
                                  {
                                    yWidth=double.parse(_wController2.text);

                                  }
                                  if(_lController2.text=="")
                                  {

                                    yLength=0;
                                  }
                                  else
                                  {
                                    yLength=double.parse( _lController2.text);
                                  }

                                  if(_dController2.text=="")
                                  {

                                    yDepth=0;
                                  }
                                  else
                                  {
                                    yDepth=double.parse(_dController2.text);
                                  }







                                  if( _wController3.text=="")
                                  {
                                    mWidth=0;

                                  }
                                  else
                                  {
                                    mWidth=double.parse(_wController3.text);

                                  }
                                  if(_lController3.text=="")
                                  {

                                    mLength=0;
                                  }
                                  else
                                  {
                                    mLength=double.parse(_lController3.text);

                                  }

                                  if(_dController3.text=="")
                                  {

                                    mDepth=0;
                                  }
                                  else
                                  {
                                    mDepth=double.parse(_dController3.text);
                                  }




                                  fVolume=(fLength/2)*(fWidth/2)*fDepth;
                                  yVolume=(yLength/2)*(yWidth/2)*yDepth;
                                  mVolume=(mLength/2)*(mWidth/2)*mDepth;

                                  fLiters=fVolume*fConv;
                                  yLiters=yVolume*yConv;
                                  mLiters=mVolume*mConv;




                                  finalLiters=fLiters+yLiters+mLiters;
                                  calcLController.text=(finalLiters).toStringAsFixed(2)+" Ltr";
                                  galCalcLController.text=(finalLiters*0.264172052).toStringAsFixed(2)+" US Gal";
                                },
                                keyboardType: TextInputType.number
                            ),
                          ),
                          DataCell(
                            TextField(
                                controller: _dController2,
                                onChanged:(String value) async {


                                  if(_wController1.text=="")
                                  {
                                    fWidth=0;

                                  }
                                  else
                                  {
                                    fWidth=double.parse(_wController1.text);
                                  }
                                  if(_lController1.text=="")
                                  {

                                    fLength=0;
                                  }
                                  else
                                  {
                                    fLength=double.parse(_lController1.text);
                                  }

                                  if(_dController1.text=="")
                                  {

                                    fDepth=0;
                                  }
                                  else
                                  {
                                    fDepth=double.parse(_dController1.text);
                                  }






                                  if( _wController2.text=="")
                                  {
                                    yWidth=0;

                                  }
                                  else
                                  {
                                    yWidth=double.parse(_wController2.text);

                                  }
                                  if(_lController2.text=="")
                                  {

                                    yLength=0;
                                  }
                                  else
                                  {
                                    yLength=double.parse( _lController2.text);
                                  }

                                  if(_dController2.text=="")
                                  {

                                    yDepth=0;
                                  }
                                  else
                                  {
                                    yDepth=double.parse(_dController2.text);
                                  }







                                  if( _wController3.text=="")
                                  {
                                    mWidth=0;

                                  }
                                  else
                                  {
                                    mWidth=double.parse(_wController3.text);

                                  }
                                  if(_lController3.text=="")
                                  {

                                    mLength=0;
                                  }
                                  else
                                  {
                                    mLength=double.parse(_lController3.text);

                                  }

                                  if(_dController3.text=="")
                                  {

                                    mDepth=0;
                                  }
                                  else
                                  {
                                    mDepth=double.parse(_dController3.text);
                                  }






                                  fVolume=(fLength/2)*(fWidth/2)*fDepth;
                                  yVolume=(yLength/2)*(yWidth/2)*yDepth;
                                  mVolume=(mLength/2)*(mWidth/2)*mDepth;

                                  fLiters=fVolume*fConv;
                                  yLiters=yVolume*yConv;
                                  mLiters=mVolume*mConv;




                                  finalLiters=fLiters+yLiters+mLiters;
                                  calcLController.text=(finalLiters).toStringAsFixed(2)+" Ltr";
                                  galCalcLController.text=(finalLiters*0.264172052).toStringAsFixed(2)+" US Gal";
                                },
                                keyboardType: TextInputType.number
                            ),
                          ),
                          DataCell(
                            TextField(
                                controller: _dController3,
                                onChanged:(String value) async {


                                  if(_wController1.text=="")
                                  {
                                    fWidth=0;

                                  }
                                  else
                                  {
                                    fWidth=double.parse(_wController1.text);
                                  }
                                  if(_lController1.text=="")
                                  {

                                    fLength=0;
                                  }
                                  else
                                  {
                                    fLength=double.parse(_lController1.text);
                                  }

                                  if(_dController1.text=="")
                                  {

                                    fDepth=0;
                                  }
                                  else
                                  {
                                    fDepth=double.parse(_dController1.text);
                                  }






                                  if( _wController2.text=="")
                                  {
                                    yWidth=0;

                                  }
                                  else
                                  {
                                    yWidth=double.parse(_wController2.text);

                                  }
                                  if(_lController2.text=="")
                                  {

                                    yLength=0;
                                  }
                                  else
                                  {
                                    yLength=double.parse( _lController2.text);
                                  }

                                  if(_dController2.text=="")
                                  {

                                    yDepth=0;
                                  }
                                  else
                                  {
                                    yDepth=double.parse(_dController2.text);
                                  }







                                  if( _wController3.text=="")
                                  {
                                    mWidth=0;

                                  }
                                  else
                                  {
                                    mWidth=double.parse(_wController3.text);

                                  }
                                  if(_lController3.text=="")
                                  {

                                    mLength=0;
                                  }
                                  else
                                  {
                                    mLength=double.parse(_lController3.text);

                                  }

                                  if(_dController3.text=="")
                                  {

                                    mDepth=0;
                                  }
                                  else
                                  {
                                    mDepth=double.parse(_dController3.text);
                                  }





                                  fVolume=(fLength/2)*(fWidth/2)*fDepth;
                                  yVolume=(yLength/2)*(yWidth/2)*yDepth;
                                  mVolume=(mLength/2)*(mWidth/2)*mDepth;

                                  fLiters=fVolume*fConv;
                                  yLiters=yVolume*yConv;
                                  mLiters=mVolume*mConv;




                                  finalLiters=fLiters+yLiters+mLiters;
                                  calcLController.text=(finalLiters).toStringAsFixed(2)+" Ltr";
                                  galCalcLController.text=(finalLiters*0.264172052).toStringAsFixed(2)+" US Gal";
                                },
                                keyboardType: TextInputType.number
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 60,
                ),
                Center(
                  child: Container(
                      width: width/1.1,
                      child: Divider(
                        color: Colors.grey[70],
                        thickness: 1.0,
                      )),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Center(
                  child: Container(
                    width: width / 1.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Calculated Volume',
                          style: TextStyle(
                              color: Color(0xff324980),
                              fontWeight: FontWeight.bold,
                              fontSize: height / 45),
                        ),
                        Center(
                            child: TextField(
                              controller: galCalcLController,
                              enabled: false,
                              style: TextStyle(fontSize: 18),
                            ),),
                        SizedBox(
                          height: height / 70,
                        ),
                        Center(
                            child: TextField(
                              controller: calcLController,
                              enabled: false,
                              style: TextStyle(fontSize: 18),
                            ),),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 60,
                ),

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

List<String> _product = ['Product 1', 'Product 2', 'Product 3', 'Product 4']; //
String _selectedProduct;
List<String> _volumeUnits = ['Unit 1', 'Unit 2', 'Unit 3', 'Unit 4']; //
String _selectedVolumeUnits;
