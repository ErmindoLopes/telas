import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  
 

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }


  Widget _buildUI() {
  
    return Scaffold(
      backgroundColor: Color(0xffe6e6e6),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );

  }


  AppBar _buildAppBar(){
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff4DB151),        
        centerTitle: true,
        title: Card(
          margin: EdgeInsets.symmetric(vertical: 10),
          elevation: 8,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                color: Colors.black54,
                padding: EdgeInsets.zero,                
                onPressed: (){print("asda");},
              ),
              Text(
                "Título",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "sans-serif",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              IconButton(
                icon: Icon(Icons.search), 
                color: Colors.black54,
                padding: EdgeInsets.zero,
                onPressed: (){print("asda");},
              ),
            ],
          )
        ),
      );

  }


  Widget _buildBody(){
    
    return ListView(
      children: <Widget>[
        _getNews(),
        _getList(),
      ],
      
    );

  }


  Widget _getNews(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[        
        
        Container(
          margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 5),
          child: Text(
            "Novidades",                      
            style: TextStyle(
              fontFamily: "sans-serif-medium",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),

          ),
        ),

          
        Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          elevation: 1,
          child: Column(
            children: <Widget>[
              
              Stack(
                alignment: Alignment.center,
                children: <Widget>[

                  Container(
                    height: 200,
                    color: Color(0xffcccccc),
                    child: Container(), //conteudo do slide
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Material(                    
                      child: Container(
                        height: 35,
                        width: 20,
                        color: Color(0x40000000),
                        child: InkWell(
                          splashColor: Colors.amberAccent,
                          child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,),
                          onTap: (){},
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Material(                    
                      child: Container(
                        height: 35,
                        width: 20,
                        color: Color(0x40000000),
                        child: InkWell(
                          splashColor: Colors.amberAccent,
                          child: Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white,),
                          onTap: (){},
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              
              ButtonTheme.bar( 
                
                child: ButtonBar( 
                  alignment: MainAxisAlignment.spaceBetween,                 
                  children: <Widget>[
                    Text("asdasdsad"),
                    Material(
                      child: InkWell(
                        splashColor: Colors.amberAccent,
                        child: Icon(Icons.forward, size: 20,),
                        onTap: (){},
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
        

      ],
    );

  }

  Widget _getList(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[        
        
        Container(
          margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 5),
          child: Text(
            "Lista",                      
            style: TextStyle(
              fontFamily: "sans-serif-medium",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),

          ),
        ),

          
        _ListItem(
          leadingColor: Colors.red.withOpacity(0.9),
          leadingIcon: Icon(Icons.home, color: Colors.white, size: 40,),
          title: "Teste de titulo",
          subtitle: "Sub titulo grande debbnasmd basmdadand, d asd asdsajdsndkasd dasdksadjsalkd",
          tap: (){ print ("printttt");},
        ),

        _ListItem(
          leadingColor: Colors.purple.withOpacity(0.9),
          leadingIcon: Icon(Icons.transfer_within_a_station, color: Colors.white, size: 40,),
          title: "Teste de titulo",
          subtitle: "Sub titulo grande debbnasmd basmdadand, d asd asdsajdsndkasd dasdksadjsalkd",
          tap: (){ print ("printttt");},
        ),
        
        _ListItem(
          leadingColor: Colors.pink.withOpacity(0.9),
          leadingIcon: Icon(Icons.tv, color: Colors.white, size: 40,),
          title: "Teste de titulo",
          subtitle: "Sub titulo grande debbnasmd basmdadand, d asd asdsajdsndkasd dasdksadjsalkd",
          tap: (){ print ("printttt");},
        ),

        _ListItem(
          leadingColor: Colors.blue.withOpacity(0.9),
          leadingIcon: Icon(Icons.vibration, color: Colors.white, size: 40,),
          title: "Teste de titulo",
          subtitle: "Sub titulo grande debbnasmd basmdadand, d asd asdsajdsndkasd dasdksadjsalkd",
          tap: (){ print ("printttt");},
        ),

        _ListItem(
          leadingColor: Colors.orange.withOpacity(0.9),
          leadingIcon: Icon(Icons.view_comfy, color: Colors.white, size: 40,),
          title: "Teste de titulo",
          subtitle: "Sub titulo grande debbnasmd basmdadand, d asd asdsajdsndkasd dasdksadjsalkd",
          tap: (){ print ("printttt");},
        ),

        _ListItem(
          leadingColor: Colors.green.withOpacity(0.9),
          leadingIcon: Icon(Icons.visibility_off, color: Colors.white, size: 40,),
          title: "Teste de titulo",
          subtitle: "Sub titulo grande debbnasmd basmdadand, d asd asdsajdsndkasd dasdksadjsalkd",
          tap: (){ print ("printttt");},
        ),


      ],
    );


  }

}


class _ListItem extends StatelessWidget {

  final Color leadingColor;
  final Widget leadingIcon;
  final String title;
  final String subtitle;
  final Function tap;
  
  _ListItem({
    this.leadingColor,
    this.leadingIcon,
    this.title,
    this.subtitle,
    this.tap,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),      
      elevation: 1,
      child: InkWell(          
        splashColor: Colors.amberAccent,
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Container(                
              padding: EdgeInsets.all(15),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4) ),
                color:leadingColor,
              ),              
              child: leadingIcon, //conteudo do slide
            ),
            
            Expanded(
              child: Container( 
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff37474F),
                        fontFamily: "sans-serif",
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 3,),
                    
                    Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "sans-serif",
                          color: Color(0xff999999),
                        ),
                        
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    
                  ],
                ),
              ),
            ),
            
          ],
        ),
        onTap: tap,
      ),
    );
  }
}
