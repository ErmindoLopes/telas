
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:telas/pages/componentes/widgets/detail_description.dart';
import 'package:telas/pages/componentes/widgets/detail_galery.dart';
import 'package:telas/utils/constants.dart';


class DetailProd1 extends StatefulWidget {
  @override
  _DetailProd1State createState() => _DetailProd1State();
}

class _DetailProd1State extends State<DetailProd1> {
  
  final _scrollController = new ScrollController();  
  final Color bgColor = const Color(0xffe6e6e6);
  Size screenSize;


  dynamic planta = {
    "id": 2,
    "name": null,
    "sciName": "Cestrum Nocturnum",
    "especName": "Dama da Noite",
    "age": 3,
    "soil": "Terra de barranco, Vermiculita",
    "dtAquire": "2017-05-12T00:00:00+00:00",
    "howAquire": "Garden",
    "isVisible": true,
    "bonsaiSize": {
      "description": "Kifu (25 a 40 cm)",
      "id": 5
    },
    "bonsaiStyle": {
      "description": "Chokkan (ereto formal)",
      "id": 3
    },
    "historyList": [
      {
        "dtCad": "2019-10-26T19:37:52.112609+00:00",
        "history": "Criação"
      }
    ],
    "likeList_aggregate": {
      "aggregate": {
        "count": 4
      }
    },
    "mediaList": [
      {
        "isPrincipal": true,
        "url": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fjunk%2F4.jpg?alt=media&token=a4a628e7-c42b-4220-8359-d0fe1684c915"
      },
      {
        "isPrincipal": false,
        "url": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fjunk%2F18.jpg?alt=media&token=8e4e1f50-53a3-405d-a66b-b2e8684de02e"
      },
      {
        "isPrincipal": false,
        "url": "https://www.youtube.com/watch?v=TQXHgE2sCF4"
      },
      {
        "isPrincipal": false,
        "url": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fjunk%2F10.jpg?alt=media&token=24acf5a5-f416-47f0-99ef-d85b0faac12f"
      },
      {
        "isPrincipal": false,
        "url": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fjunk%2F1.jpg?alt=media&token=d28c9fa4-93c9-4da9-8cc4-99cb3845c0e1"
      },
      {
        "isPrincipal": false,
        "url": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fjunk%2F11.jpg?alt=media&token=955439c2-d270-4e3d-ba13-98a54a03f615"
      },
      {
        "isPrincipal": false,
        "url": "https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fjunk%2F11.jpg?alt=media&token=955439c2-d270-4e3d-ba13-98a54a03f615"
      },
    ],
    "likeList": []
  };




 
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
            //_buildFab(),
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
            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/aditek-shop.appspot.com/o/resources%2Fjunk%2F4.jpg?alt=media&token=a4a628e7-c42b-4220-8359-d0fe1684c915"),
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
          
          SizedBox(height: 10,),
          DetailGalery(planta),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _getName(),
                DetailDescription(planta),
                //RelatedProduct(product),
              ],
            ),
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

  Widget _getName(){

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text(              
                "Nome:  um doi s asdasdasdadas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
              Text(              
                "(asdasdsadsadsadsa asdsad)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          )
        ),
        SizedBox(height: 10),
        // Row(
        //   children: <Widget>[
        //     Text(Tools.getCurrecyFormatted(price),
        //         style: Theme.of(context)
        //             .textTheme
        //             .headline
        //             .copyWith(fontSize: 17, color: theme.accentColor)),
        //     if (onSale) SizedBox(width: 5),
        //     if (onSale)
        //       Text(Tools.getCurrecyFormatted(regularPrice),
        //           style: Theme.of(context).textTheme.headline.copyWith(
        //               fontSize: 16,
        //               color: Theme.of(context).accentColor,
        //               decoration: TextDecoration.lineThrough)),
        //   ],
        // ),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 10.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       SmoothStarRating(
        //           allowHalfRating: true,
        //           starCount: 5,
        //           rating: product.averageRating,
        //           size: 17.0,
        //           color: theme.primaryColor,
        //           borderColor: theme.primaryColor,
        //           spacing: 0.0),
        //     ],
        //   ),
        // ),
      ],
    );

  }


  
}




