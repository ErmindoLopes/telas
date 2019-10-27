
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:telas/utils/constants.dart';
import 'package:telas/utils/functions.dart';

class ListPage2 extends StatefulWidget {
  @override
  _ListPage2State createState() => _ListPage2State();
}

class _ListPage2State extends State<ListPage2> {
  
  final _scrollController = new ScrollController();  
  final Color bgColor = const Color(0xffe6e6e6);
  Size screenSize;
 
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {    
    screenSize = MediaQuery.of(context).size;
    return _buildUI();
  }


  Widget _buildUI() {

    return Container(
      color: kBackgroundColor,
      child: SafeArea(
        bottom: false,
        top: false,
        child: Stack(
          children: <Widget>[

            Scaffold(              
              backgroundColor: kBackgroundColor,
              body: CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  _buildAppBar(),
                  _buildBody(),
                ],
              ),
              
            ),
            _buildFab(),
          ],
        ),
      ),
    );

  }


  SliverAppBar _buildAppBar(){
    return SliverAppBar( 
      leading: IconButton(icon: Icon(Icons.arrow_back), color: Colors.white,onPressed: (){ Navigator.of(context).pop();},),     
      backgroundColor: kPrimaryColor,
      elevation: 1.0,
      expandedHeight: screenSize.height / 3.0,
      pinned: true,
      floating: false,      
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search), 
          color: Colors.white,
          padding: EdgeInsets.zero,
          onPressed: (){print("asda");},
        ),
        SizedBox(width: 5,)
      ],
      titleSpacing: 0,      
      flexibleSpace: _buildAppBarContent(), 
    );

  }

  Widget _buildAppBarContent(){

    return FlexibleSpaceBar(
      centerTitle: true,
      title: Text("Titulo da Página"),      
      background: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img2.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.colorBurn),
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 70,
              child: ClipRect(                
                child: BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: new Container(
                    decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),                
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: Container(),),
            Container(
              height: 60,
              child: ClipRect(                
                child: BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: new Container(
                    decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),                
                  ),
                ),
              ),
            )
          
          ],
        ),
      ),      
    );
  
  }


  Widget _buildBody(){
    

    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 60),
            child: _getList(),
          )

        ],
      ),
    );

  }
    
  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = (screenSize.height / 3.0) - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 96.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return new Positioned(
      top: top,
      right: 16.0,
      child: new Transform(
        transform: new Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: new FloatingActionButton(
          onPressed: () => {},
          child: new Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _getList(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[        
        
        ...injectAdmob(
          List.generate(
            9, 
            (index){
              return _ListItem(
                leadingColor: Colors.red.withOpacity(0.9),
                leadingIcon: Icon(Icons.home, color: Colors.white, size: 40,),
                title: "$index Teste de titulo",
                subtitle: "Sub titulo grande debbnasmd basmdadand, d asd asdsajdsndkasd dasdksadjsalkd",
                tap: (){ print ("printttt");},
              );
            }
          ),
          inject: true
        )

      
      ],
    );


  }


  List<dynamic> newsList(){
    return [
        {
            "image": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fimages%2Fnews%2F1.png?alt=media&token=7ead18c6-8c3a-4857-8dca-eca024621fa4",
            "command": "prod:1"
        },
        {
            "image": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fimages%2Fnews%2F10.png?alt=media&token=91bf468e-60f6-4284-abdb-e6074a304260",
            "command": "prod:1"
        },
        {
            "image": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fimages%2Fnews%2F2.jpg?alt=media&token=e84d5fd5-bcb8-4a08-89b9-58e4e23c5cc0",
            "command": "categ:1"
        },
        {
            "image": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fimages%2Fnews%2F3.png?alt=media&token=3116c47c-85e0-427f-992a-3342b5afc305",
            "command": "promo:1"
        },
        {
            "image": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fimages%2Fnews%2F4.jpg?alt=media&token=986ce571-340a-46d8-9333-aee1b45b7ecd",
            "command": "prod:1"
        },
        {
            "image": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fimages%2Fnews%2F5.png?alt=media&token=f0297de1-9df0-4301-b388-fd456d2ff6ea",
            "command": "prod:1"
        },
        {
            "image": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fimages%2Fnews%2F6.png?alt=media&token=e5f9a0a5-a375-45a1-8279-ec8fed7586d3",
            "command": "prod:1"
        },
        {
            "image": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fimages%2Fnews%2F7.png?alt=media&token=8caef9b3-8e9f-4f50-b9da-cb94b2b71341",
            "command": "prod:1"
        },
        {
            "image": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fimages%2Fnews%2F8.png?alt=media&token=dbba157f-dad4-487d-929e-dc3e175992c8",
            "command": "prod:1"
        }
    ];
  }
  
}





class   _ListItem extends StatelessWidget {

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
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 3,),
                    
                    Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Raleway",
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

