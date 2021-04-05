import 'package:flutter/material.dart';
import 'package:ocion/Constants.dart';




class CustomTextField extends StatelessWidget {


  CustomTextField({@required this.hinttext,this.text,this.obscureText,this.textInputType,this.textInputAction,this.textColor,this.iconButton});
  final String hinttext,text;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Color textColor;
  final IconButton iconButton;





  @override
  Widget build(BuildContext context) {



    TextEditingController _controller=text!=null?TextEditingController(text: text):null;
    if(_controller!=null) {
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
    }
    OutlineInputBorder outlineInputBorder =  const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 0.0),
    );


    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      Container(
      width: width/1.1,
      child: TextFormField(
        style: TextStyle(
            color:  Color(0xff8f8f8f),
            fontSize: 14,
            //fontFamily: 'workSans',

        ),

        textInputAction: textInputAction!=null?textInputAction:TextInputAction.next,
        keyboardType: textInputType,
        obscureText: obscureText == null ? false : obscureText,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        cursorColor:  Color(0xff8f8f8f),
        decoration: new InputDecoration(
            contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),

            suffixIcon: iconButton,

            border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(8.0),
                ),
                borderSide: BorderSide(color: Color(0xffF3F3F3))
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(8.0),
              ),
              borderSide: BorderSide(color: Color(0xffF3F3F3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(8.0),
              ),
              borderSide: BorderSide(color: Color(0xffF3F3F3)),
            ),



            filled: true,
            hintStyle: new TextStyle(color: Colors.grey[800].withOpacity(0.5),fontSize: 14),
            hintText: hinttext,
            fillColor: backgroundColor
        ),
      ),
    );
  }
}
class CustomeTableField extends StatelessWidget {


  CustomeTableField({@required this.hinttext,this.text,this.obscureText,this.textInputType,this.textInputAction,this.textColor,this.iconButton});
  final String hinttext,text;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Color textColor;
  final IconButton iconButton;





  @override
  Widget build(BuildContext context) {



    TextEditingController _controller=text!=null?TextEditingController(text: text):null;
    if(_controller!=null) {
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
    }
    OutlineInputBorder outlineInputBorder =  const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 0.0),
    );


    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      Container(
        //width: width/1.1,
        child: TextFormField(
          style: TextStyle(
            color:  Color(0xff8f8f8f),
            //fontSize: ,
            //fontFamily: 'workSans',
            fontSize: height/60

          ),
          maxLength: 7,
          decoration: InputDecoration(
            hintText: "",
            counterText: "",
          ),
          textInputAction: textInputAction!=null?textInputAction:TextInputAction.next,
          keyboardType: textInputType,
          obscureText: obscureText == null ? false : obscureText,
          onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
          cursorColor:  Colors.black,
          // decoration: new InputDecoration(
          //     contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          //
          //     suffixIcon: iconButton,
          //
          //     border: new OutlineInputBorder(
          //         borderRadius: const BorderRadius.all(
          //           const Radius.circular(8.0),
          //         ),
          //         borderSide: BorderSide(color: Color(0xffF3F3F3))
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: const BorderRadius.all(
          //         const Radius.circular(8.0),
          //       ),
          //       borderSide: BorderSide(color: Color(0xffF3F3F3)),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: const BorderRadius.all(
          //         const Radius.circular(8.0),
          //       ),
          //       borderSide: BorderSide(color: Color(0xffF3F3F3)),
          //     ),
          //
          //
          //
          //     filled: true,
          //     hintStyle: new TextStyle(color: Colors.grey[800].withOpacity(0.5),fontSize: 14),
          //     hintText: hinttext,
          //    // fillColor: backgroundColor
          // ),
        ),
      );
  }
}