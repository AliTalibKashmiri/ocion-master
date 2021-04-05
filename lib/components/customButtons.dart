import 'package:flutter/material.dart';
import 'package:ocion/Constants.dart';

class walkthroghButton extends StatelessWidget {
  walkthroghButton(
      {@required this.onPressed,
      this.iconss,
      this.focusColor,
      this.disbaleColor,
      this.colorss});
  final GestureTapCallback onPressed;
  final Icon iconss;
  final Color focusColor, disbaleColor, colorss;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width / 8,
      height: MediaQuery.of(context).size.height / 12,
      // decoration: new BoxDecoration(
      //      color: Colors.blue,
      //     borderRadius: new BorderRadius.only(
      //         topLeft: const Radius.circular(150.0),
      //         topRight: const Radius.circular(150.0),
      //         bottomRight: const Radius.circular(150.0),
      //         bottomLeft: const Radius.circular(150.0)
      //     )
      // ),
      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 5,
        focusColor: focusColor,
        disabledColor: disbaleColor,
        shape: CircleBorder(),
        color: basicColor,
        textColor: colorss,

        onPressed: onPressed,

        child: iconss,
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {


  CustomButton1({@required this.onPressed, this.text,this.focusColor,this.disbaleColor});
  final GestureTapCallback onPressed;
  final Text text;
  final Color focusColor, disbaleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.6,
      height: MediaQuery.of(context).size.height/18,
      // ignore: deprecated_member_use
      child: RaisedButton(
        focusColor: focusColor,
        disabledColor: disbaleColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

        ),
        color: basicColor,
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,


        child: text,
      ),
    );
  }
}
class resetButton extends StatelessWidget {


  resetButton({@required this.onPressed, this.text,this.focusColor,this.disbaleColor});
  final GestureTapCallback onPressed;
  final Text text;
  final Color focusColor, disbaleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/3.2,
      height: MediaQuery.of(context).size.height/18,
      // ignore: deprecated_member_use
      child: RaisedButton(
        focusColor: focusColor,
        disabledColor: disbaleColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

        ),
        color: basicColor,
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,


        child: text,
      ),
    );
  }
}
class volumeCalculate extends StatelessWidget {


  volumeCalculate({@required this.onPressed, this.text,this.focusColor,this.disbaleColor});
  final GestureTapCallback onPressed;
  final Text text;
  final Color focusColor, disbaleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.6,
      height: MediaQuery.of(context).size.height/18,
      // ignore: deprecated_member_use
      child: RaisedButton(
        focusColor: focusColor,
        disabledColor: disbaleColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

        ),
        color: basicColor,
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,


        child: text,
      ),
    );
  }
}
class homeButton extends StatelessWidget {


  homeButton({@required this.onPressed, this.text,this.focusColor,this.disbaleColor});
  final GestureTapCallback onPressed;
  final Text text;
  final Color focusColor, disbaleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.1,
      height: MediaQuery.of(context).size.height/18,
      // ignore: deprecated_member_use
      child: RaisedButton(
        focusColor: focusColor,
        disabledColor: disbaleColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

        ),
        color: basicColor,
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,


        child: text,
      ),
    );
  }
}
