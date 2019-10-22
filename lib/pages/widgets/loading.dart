import 'package:flutter/material.dart';

import 'custom_progress_indicator.dart';


class LoadingPage extends StatefulWidget {
  final String caption;
  final BoxDecoration decoration;
  final Color progressColor;
  final TextStyle style;
  final double width;
  final double height;
  LoadingPage({
    this.caption = "Carregando...",
    this.decoration = const BoxDecoration(color: Colors.black),
    this.progressColor = Colors.white,
    this.style,
    this.width,
    this.height,
    });

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  
  @override
  Widget build(BuildContext context) {
    return LoadingForm(
      caption : widget.caption, 
      decoration: widget.decoration, 
      progressColor: widget.progressColor, 
      style: widget.style ,
      width : widget.width,
      height: widget.height);
  }

  
}


class LoadingForm extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  final String caption;
  final BoxDecoration decoration;
  final Color progressColor;
  final TextStyle style;
  final double width;
  final double height;

  LoadingForm({
    this.caption = "Carregando...",
    this.decoration = const BoxDecoration(color: Colors.black),
    this.progressColor = Colors.white,
    this.style,
    this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width ?? MediaQuery.of(context).size.width,
      height: this.height ?? MediaQuery.of(context).size.height,
      decoration: decoration,
      child: new Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,        
        body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  this.caption,
                  textAlign: TextAlign.center,
                  style: this.style ?? new TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),                  
            ),
            Center(
              child: new CustomProgressIndicator(color: this.progressColor), //CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Colors.white), ),
            ),
            
          ],
        ),
      ),
      ),
    );
  
  }
  
}