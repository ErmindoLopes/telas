
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telas/pages/widgets/custom_carousel_bar.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  
  final _scrollController = new ScrollController();  
  final Color bgColor = const Color(0xffe6e6e6);
  Size screenSize;
 
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
      color: bgColor,
      child: SafeArea(
        bottom: false,
        top: false,
        child: Stack(
          children: <Widget>[
            Scaffold(              
              backgroundColor: bgColor,
              body: CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  _buildAppBar(),
                  _buildBody(),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }


  SliverAppBar _buildAppBar(){
    return SliverAppBar(
      backgroundColor: bgColor,
      elevation: 1.0,
      expandedHeight: screenSize.height / 3.0,
      pinned: true,
      floating: false,      
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications), 
          color: Colors.black54,
          padding: EdgeInsets.zero,
          onPressed: (){print("asda");},
        ),
        SizedBox(width: 5,)
      ],
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        margin:  EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 0),
        elevation: 4,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.search),
              color: Colors.grey[400],
              onPressed: () => {},
            ),
            Text(
              "Título",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),

          ],
        )
      ),
      flexibleSpace: _buildAppBarContent(), 
    );

  }

  Widget _buildAppBarContent(){

    return FlexibleSpaceBar(
      background: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(                
                width: screenSize.width,
                height: screenSize.height <= 593
                  ? screenSize.height / 3 + 15
                  : screenSize.height / 3 - 15,
                child: CustomCarouselBar(
                  images: newsList(),
                  bgColor: bgColor,          
                  onTap: (command){ 
                    print(command);
                  },
                ),
              ),
            ),            
          ],
        ),
      ),
    );
  
  }


  Widget _buildBody(){
    
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
        
          
          _getNews(),

          _getList(),

        ],
      ),
    );

  }
  

  Widget _getNews(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[        
        
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
          child: Text(
            "Novidades",                      
            style: TextStyle(
              fontFamily: "Raleway",
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
              fontFamily: "Raleway",
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

