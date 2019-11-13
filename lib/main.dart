import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telas/pages/animations/pulse_effect.dart';
import 'package:telas/pages/backdrop/backdrop_page.dart';
import 'package:telas/pages/componentes/comp1.dart';
import 'package:telas/pages/detail_prod/detail_prod1.dart';
import 'package:telas/pages/home/home_page_1.dart';
import 'package:telas/pages/lists/list_page_2.dart';
import 'package:telas/pages/login/login_page_1.dart';
import 'package:telas/pages/maps/maps_page_1.dart';
import 'package:telas/pages/maps/maps_page_2.dart';
import 'package:telas/pages/on_boarding/on_boarding_1.dart';
import 'package:telas/pages/splash/splash_page_1.dart';
import 'package:telas/utils/constants.dart';
import 'package:telas/utils/styles.dart';

import 'pages/home/home_page_2.dart';
import 'pages/home/home_page_3.dart';
import 'pages/lists/list_page_1.dart';
import 'utils/my_globals.dart';

void main() {

  ///Set color status bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    
  ));
  
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildLightTheme(),        
      home: MyHomePage(title: 'Exemplo de telas'),
      
      
      
      debugShowCheckedModeBanner: false,      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); 
  
  @override
  void initState() {
    super.initState();
    MyGlobals.scaffoldKey(_scaffoldKey);
    

    //espera o mounted == true para iniciar os models
    Future.doWhile((){ 
      return !mounted;
    })
      .then((_){

        Future.delayed(Duration(seconds: 2),(){

          Future.wait(
            [
              MyGlobals.init()
              
            ]
          );
          

            

        });

        
      });
    

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(          
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return Column(
      children: <Widget>[
        
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text("Home, Backdrop", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home 1"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return HomePage1(); }));
                },
              ),

              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home 2"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return HomePage2(); }));
                },
              ),

              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home 3"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return HomePage3(); }));
                },
              ),

              ListTile(
                leading: Icon(Icons.home),
                title: Text("Backdrop"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return BackdropPage(); }));
                },
              ),

            ],
          ),
        ),

        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text("List Page", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ListTile(
                leading: Icon(Icons.list),
                title: Text("List 1"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return ListPage1(); }));
                },
              ),

              ListTile(
                leading: Icon(Icons.list),
                title: Text("Lista com injeção de item"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return ListPage2(); }));
                },
              ),

            ],
          ),
        ),

        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text("Detail Prod", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ListTile(
                leading: Icon(Icons.new_releases),
                title: Text("Detail Prod 1"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return DetailProd1(); }));
                },
              ),

            ],
          ),
        ),

        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text("OnBoarding", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ListTile(
                leading: Icon(Icons.new_releases),
                title: Text("OnBoarding 1"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return OnBoarding1(); }));
                },
              ),

            ],
          ),
        ),

        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text("Widgets", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ListTile(
                leading: Icon(Icons.block),
                title: Text("Comp 1"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return Comp1(); }));
                },
              ),

            ],
          ),
        ),

        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text("Animations", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ListTile(
                leading: Icon(Icons.android),
                title: Text("Pulse"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return PulseEffect(); }));
                },
              ),

            ],
          ),
        ),

        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text("Mapas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ListTile(
                leading: Icon(Icons.map),
                title: Text("Mapas com locations"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return MapsPage1(); }));
                },
              ),

              ListTile(
                leading: Icon(Icons.map),
                title: Text("Mapas com GeoLocations"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return MapsPage2(); }));
                },
              ),

            ],
          ),
        ),

        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text("Splash", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text("Splash 1"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return SplashPage1(); }));
                },
              ),

              

            ],
          ),
        ),

        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text("Login 1"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return LoginPage1(); }));
                },
              ),

              

            ],
          ),
        ),

      ],
    );
  }

}
