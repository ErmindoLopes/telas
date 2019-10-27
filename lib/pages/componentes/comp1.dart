import 'package:flutter/material.dart';
import 'package:telas/pages/widgets/frosted_item_appbar.dart';

class Comp1 extends StatefulWidget {
  Comp1({Key key}) : super(key: key);

  @override
  _Comp1State createState() => _Comp1State();
}



class _Comp1State extends State<Comp1> {



  @override
  void initState() {
    
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
        height: _screenSize.height,
        width: _screenSize.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img3.png"),
            //image: AssetImage("assets/images/img1.jpg"),
            //image: AssetImage("assets/images/spl2.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: FrostedItemAppbar(              
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white,),
                onPressed: (){},
              )
            ),
            actions: <Widget>[
              FrostedItemAppbar(   
                position: FrostedItemEdgePosition.right,
                child: Icon(Icons.search, color: Colors.white,)
              ),
              FrostedItemAppbar(   
                position: FrostedItemEdgePosition.none,           
                child: Icon(Icons.search, color: Colors.white,)
              ),
            ],
            
          ),
          body:SafeArea(child: Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: _createComps(),
          )),
        )
      );

    
  }

  Widget _createComps(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: FrostedItemAppbar(   
                child: Icon(Icons.search, color: Colors.white,)
              ),
            ),

            Container(
              child: Row(
                children: <Widget>[
                  FrostedItemAppbar(  
                    position: FrostedItemEdgePosition.right, 
                    child: Icon(Icons.search, color: Colors.white)
                  ),
                  FrostedItemAppbar(   
                    position: FrostedItemEdgePosition.none,
                    child: Icon(Icons.search, color: Colors.white)
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}