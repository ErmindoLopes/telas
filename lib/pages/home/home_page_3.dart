import 'dart:ui';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:telas/Library/custom_curved_navigation_bar/custom_curved_navigation_bar.dart';
import 'package:telas/Library/custom_curved_navigation_bar/src/labeled_icon.dart';
import 'package:telas/pages/widgets/vertical_drag_bottom_sheet.dart';
import 'package:telas/utils/constants.dart';
import 'package:telas/utils/dialogs.dart';

class HomePage3 extends StatefulWidget {
  HomePage3({Key key}) : super(key: key);

  @override
  _HomePage3State createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey = GlobalKey<InnerDrawerState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();  
  final _scrollController = new ScrollController();  

  Size _screenSize;
  double _offset = 0.6;
  double _scale = 0.9;
  double _borderRadius = 25;
  bool _swipe = true;
  InnerDrawerAnimation _animationType = InnerDrawerAnimation.quadratic;
  Color currentColor = Colors.black54;
 

  @override
  void dispose() { 
  
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {    
    _screenSize = MediaQuery.of(context).size;

    return _buildUI();
  }

  Widget _buildUI(){

    return Container(
      color: kBackgroundColor,
      width: _screenSize.width,
      height: _screenSize.height,
      child: SafeArea(
        bottom: false,
        top: false,
        child: Stack(
          children: <Widget>[
            WillPopScope(
              onWillPop: _onBackPressed,
              child: _buildInnerDrawer(),
            ),
            
          ],
        ),
      ),
    
    
    );

  }


  Widget _buildInnerDrawer(){
    return InnerDrawer(
      key: _innerDrawerKey,
      onTapClose: true,
      leftOffset: _offset,
      rightOffset: _offset,
      leftScale: _scale,
      rightScale: _scale,
      borderRadius: _borderRadius,
      swipe: _swipe,
      colorTransition: currentColor,
      leftAnimationType: _animationType,
      rightAnimationType: _animationType,
      leftChild: Material(
        color: Theme.of(context).backgroundColor,
        child: _buildLeftDrawer()
      ),      
      scaffold: _buildScaffold(),
    );

  }

  Widget _buildScaffold(){
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kBackgroundColor,
      appBar: _buildAppBar(),
      body: VerticalDragBottomSheet(
        headerColor: kSecondaryDarkColor,
        bottomBar: _buildBottomBar(),
        innerContent: _buildBottomSeetContent(),
        outerContent: _buildBody(),
      ),
    );
  }

  Widget _buildLeftDrawer(){

    return Container(
      child: Text(
        "Left Child",
        style: TextStyle(fontSize: 18),
      )
    );
  }

  Widget _buildBottomSeetContent(){
    return Container(
      color: Colors.amber.withOpacity(0.2),
      margin: EdgeInsets.all(10),
    );
  }

  
  Widget _buildBody(){
    
       
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          "assets/images/bg3.jpg",
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.colorBurn,
          color: Colors.black38,          
        ),
        
        //permafrost
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 6),
          child: Container(
            //color: Color.fromRGBO(0, 0, 0, 0.5),
            color: Colors.grey.shade200.withOpacity(0.2)
          ),
        ),

        ListView(
          children: <Widget>[
            _getNews(),
            //_getList(),
          ],
          
        )
      ],
    );

  }

  

  Widget _buildBottomBar(){

    return CustomCurvedNavigationBar(
        //key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <LabeledIcon>[
          LabeledIcon(index:0, icon:Icons.home, text: "Home", iconSize: 30, style: TextStyle(fontSize: 10),),
          LabeledIcon(index:1, icon:Icons.layers, text: "Categorias", iconSize: 30, style: TextStyle(fontSize: 10),),
          LabeledIcon(index:2, icon:Icons.chat, text: "Contato", iconSize: 30, style: TextStyle(fontSize: 10),),
          LabeledIcon(index:3, icon:Icons.person, text: "Conta", iconSize: 30, style: TextStyle(fontSize: 10),),
          LabeledIcon(index:4, icon:Icons.shopping_cart, text: "Carrinho", iconSize: 30, style: TextStyle(fontSize: 10),),
        ],
        color: kSecondaryColor,
        buttonBackgroundColor: kSecondaryColor,
        backgroundColor: kSecondaryDarkColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          
        },

      );

  }

  AppBar _buildAppBar(){
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,        
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
                onPressed: (){ _innerDrawerKey.currentState.toggle();},
              ),
              Text(
                "Título",
                textAlign: TextAlign.center,
                style: TextStyle(                  
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              IconButton(
                icon: Icon(Icons.search), 
                color: Colors.black54,
                padding: EdgeInsets.zero,
                onPressed: (){
                  Flushbar(
                    message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    icon: Icon(
                      Icons.info_outline,
                      size: 28.0,
                      color: Colors.red[900],
                    ),
                    //duration: Duration(days: 3),
                    flushbarPosition: FlushbarPosition.TOP,
                    //isDismissible: false,
                    leftBarIndicatorColor: Colors.red[900],
                    backgroundColor: Colors.red[300],
                  )..show(context);
                },
              ),
            ],
          )
        ),
      
      );

  }

  Widget _getNews(){

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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

  

  Future<bool> _onBackPressed() async{

    final action = await Dialogs.yesAbortDialog(
      context,
      "Sair",
      "Deseja fechar o aplicativo?"
    );

    var ret = action == DialogAction.yes; 

    return Future.value(ret);
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
