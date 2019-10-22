import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final double height;
  final double width;
  final double radius;
  final Color cor1;
  final Color cor2;
  final Color splashColor;
  final Color textColor;
  final EdgeInsetsGeometry margin;
  final String texto;
  final Widget leading;
  final Function tap;
  final double fontSize;

  RoundedButton({
    this.height = 55,
    this.width = 600,
    this.radius = 30,
    this.cor1 = const Color(0xFF121940),
    this.cor2 = const Color(0xFF6E48AA),
    this.textColor = Colors.white,
    this.splashColor, // = const Color(0xFF6E48AA),
    this.margin = const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
    this.texto = "Btn",
    this.leading = const IgnorePointer(),
    this.tap,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(      
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(colors: <Color>[cor1, cor2]),
        boxShadow: (cor1 == Colors.transparent && cor2 == Colors.transparent) 
          ? null
          : [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
      ),
      child: FlatButton(
        splashColor: splashColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            leading,
            Text(
              texto,
              style: TextStyle(
                color: textColor,
                letterSpacing: 0.2,
                fontFamily: "Sans",
                fontSize: fontSize,
                fontWeight: FontWeight.w800
              ),
            ),
          ],
        ),
        textColor: textColor,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        onPressed: tap,        
      ),
    );
  }
}
