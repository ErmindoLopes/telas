

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:telas/pages/widgets/custom_progress_indicator.dart';
import 'package:telas/pages/widgets/loading.dart';
import 'package:telas/utils/constants.dart';

class SplashPage1 extends StatefulWidget {
  @override
  _SplashPage1State createState() => _SplashPage1State();
}

class _SplashPage1State extends State<SplashPage1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _random = new Random();
  bool apagar = false;

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kBackgroundColor,
      body: _buildBody(),
    );

  }


  Widget _buildBody() {

    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.passthrough,
      overflow: Overflow.visible,
      children: <Widget>[        
      
        Container(
          height: 220,
          color: kPrimaryColor,
        ),


        Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          child: Image.asset("assets/images/bg-login1.png", width: 82.5, height: 104 ),
        ),

        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(bottom: 20, top: 50),
                child: Text(
                  "Sadasdsadsadsad",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 20, top: 50),
                child: CircleAvatar(
                  backgroundColor: kBackgroundColor,
                  child: Image.asset("assets/images/logo.png", width:90, height:90),
                  maxRadius: 45,                  
                )
              ),

              Container(
                margin: EdgeInsets.only(top: 100),
                child: _progressBar()
              ),

              Container(
                margin: EdgeInsets.only(bottom: 20, top: 10),
                child: Column(
                  children: <Widget>[
                    CustomProgressIndicator(color: Colors.black,),
                    Text(
                      "Sadasdsadsadsad",
                      style: TextStyle(
                        color: Colors.black45,                    
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                )
              ),
              
              
            ],

          ),
        ),
        
        _loading(),
        

      ],
    );

  }


  void _googleLogin() async{

    
    
  }

  void _facebookLogin() async{
    
    
  }

  Widget _loading(){

    // return StreamBuilder<bool>(
    //   initialData: false,
    //   stream: _loadingBloc.outLoading,
    //   builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {

    //     if(snapshot.data){
    //       return  Opacity(
    //         opacity: 0.5,
    //         child: LoadingForm(caption: "Fazendo Login...",),
    //       );
    //     }
    //     else{
    //       return IgnorePointer();
    //     }

    //   }
    // );


    if (apagar){
      
      return Stack(
        children: <Widget>[
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 6),
            child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ),
          LoadingForm(caption: "Fazendo Login...", decoration: BoxDecoration(),),
        ],
      );
      
    }else{
      return IgnorePointer();
    }

  }

  Widget _progressBar(){

    return Container(
      width: MediaQuery.of(context).size.width,
      child: 50 == 0
        ? Container( height: 60,)
        : Container(
            height: 60,
            child: Column(                                      
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(bottom: 8, left: 50, right: 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.amber[50],
                      value: 50 / 100.0 ,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber[600]),
                    ),
                  ),
                ),

                Text(
                  "50%",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: kPrimaryDarkColor,
                    fontSize: 18.0,
                  ),
                ),

                SizedBox(height: 20,)
                
              ],
            ),
          ),
    );
  
    

  }
  
}