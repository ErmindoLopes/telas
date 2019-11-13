import 'package:flutter/material.dart';
import 'package:telas/pages/widgets/backdrop.dart';
import 'package:telas/pages/widgets/frosted_item_appbar.dart';

class BackdropPage extends StatefulWidget {
  @override
  _BackdropPageState createState() => _BackdropPageState();
}

class _BackdropPageState extends State<BackdropPage> with SingleTickerProviderStateMixin{

  AnimationController _backDropController;

  @override
  void initState() {
    
    super.initState();
    
    _backDropController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
      value: 1.0,
    );

    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Backdrop(
        frontLayer: Container(
          color: Colors.red,
        ),          
        backLayer: Container(
          //color: Colors.blue,
        ),
        frontTitle: Text(
          "Meus Viveiros",
          style: TextStyle(
            fontSize: 30
          ),
        ),
        backTitle: Text(
          "Filtrar",
          style: TextStyle(
            fontSize: 30
          ),
        ),
        actions: <Widget>[
          FrostedItemAppbar(
            position: FrostedItemEdgePosition.right,
            child: IconButton(
              icon: Icon(
                Icons.android,
              ),
              color: Colors.white,
              onPressed: (){}
            ),
          )
        ],
        imagePath: "assets/images/backdrop1.png",
        controller: _backDropController,
      )
      
    );
    
    
    
    
    
  }

}