import 'package:flutter/material.dart';
import 'package:telas/pages/home/home_page_1.dart';

void main() => runApp(MyApp());

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


      ],
    );
  }

}
