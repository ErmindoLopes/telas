

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:telas/pages/widgets/loading.dart';
import 'package:telas/pages/widgets/rounded_button.dart';
import 'package:telas/utils/constants.dart';

class LoginPage1 extends StatefulWidget {
  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
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
          child: Image.asset("assets/images/bg-login${nextNum(1, 6)}.png", width: 82.5, height: 104 ),
        ),

        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(bottom: 20, top: 15),
                child: CircleAvatar(
                  backgroundColor: kBackgroundColor,
                  child: Image.asset("assets/images/logo.png", width:90, height:90),
                  maxRadius: 45,                  
                )
              ),
              
              Card(
                margin: EdgeInsets.all(10),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                child: Container(
                  width: double.infinity,                  
                  padding: EdgeInsets.all(10),
                  child: Column(

                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.only(top: 35, bottom: 35),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      RoundedButton(
                        texto: "Login com Facebook",
                        cor1: kFacebookColor,
                        cor2: kFacebookColor,
                        height: 55,
                        fontSize: 15,
                        leading: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.0),
                          child: Image.asset("assets/images/ic-facebook.png",height: 25.0,),
                        ),
                        tap: (){ _facebookLogin(); },
                      ),

                      RoundedButton(
                        texto: "Login com Google",
                        cor1: Colors.white,
                        cor2: Colors.white,
                        height: 55,
                        textColor: Colors.black54,
                        fontSize: 15,
                        leading: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.0),
                          child: Image.asset("assets/images/ic-google.png",height: 25.0,),
                        ),
                        tap: (){ _googleLogin(); },
                      ),
                      
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 15),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          height: 2, 
                          color: Colors.black45,
                        )
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        child: Wrap(
                          direction: Axis.vertical,                          
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[

                            

                            Text(
                              "Vamos simplificar as coisas para você. ;-)",
                              style: TextStyle(                                
                                fontSize: 12,                                
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              "Utilize seu login social para entrar.",
                              style: TextStyle(
                                fontSize: 12,                                
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        )
                      ),

                    ],

                  ),
                ),
              ),

            ],

          ),
        ),
        
        loading(),
        

      ],
    );

  }


  void _googleLogin() async{

    
    
  }

  void _facebookLogin() async{
    
    
  }

  Widget loading(){

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


  /*
  * Generates a positive random integer uniformly distributed on the range
  * from [min], inclusive, to [max], exclusive.
  */
  int nextNum(int min, int max) => min + _random.nextInt(max - min);

  
}