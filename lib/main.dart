import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telas/pages/animations/pulse_effect.dart';
import 'package:telas/pages/home/home_page_1.dart';
import 'package:telas/pages/maps/maps_page_1.dart';
import 'package:telas/pages/maps/maps_page_2.dart';
import 'package:telas/pages/on_boarding/on_boarding_1.dart';

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
      theme: ThemeData( 
        backgroundColor: Color(0xffE6E6E6),//Color(0xfffffbe6),   
        primaryColor: Color(0xff356859),
        accentColor: Color(0xff29302e),        
      ),
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
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
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
              Center(child: Text("Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home 1"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){ return HomePage1(); }));
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
              Center(child: Text("Sign Up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text("Sign Up 1"),
                onTap: (){
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context){ return SignUp1(); }));
                },
              ),

              

            ],
          ),
        ),


      ],
    );
  }

}
