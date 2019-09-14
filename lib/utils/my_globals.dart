import 'package:flutter/material.dart';

class MyGlobals {


  static GlobalKey<ScaffoldState> _scaffoldKey;
  static double _marginLeft =  MediaQuery.of(_scaffoldKey.currentState.context).size.width * 0.0322;
  static double _marginRight = MediaQuery.of(_scaffoldKey.currentState.context).size.width * 0.0322;

  
  static double get marginLeft => _marginLeft; 
  static double get marginRight => _marginRight;
  static BuildContext get currentContext =>_scaffoldKey.currentState.context;


  static void scaffoldKey(GlobalKey<ScaffoldState> value) { 
    
    _scaffoldKey = null;
    _scaffoldKey = value; 
    
  } 

  static Future<void> init() async{

    await Future.doWhile(() {
      if (_scaffoldKey.currentState != null) {          
        return false;
      }
      return new Future.delayed(new Duration(milliseconds: 200), () { return true; });
    });


    //associa as variaveis
    _marginLeft = MediaQuery.of(_scaffoldKey.currentState.context).size.width * 0.0322;
    _marginRight = MediaQuery.of(_scaffoldKey.currentState.context).size.width * 0.0322;

  }
  
  

}