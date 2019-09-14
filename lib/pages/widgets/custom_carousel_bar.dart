import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:telas/utils/my_globals.dart';




class CustomCarouselBar extends StatefulWidget {

  final List images;
  final Color bgColor;
  final Function onTap;

  CustomCarouselBar({
    this.images,
    this.bgColor,
    this.onTap,
  });

  @override
  _CustomCarouselBarState createState() => _CustomCarouselBarState(
    images:images,
    bgColor:bgColor,
    onTap:onTap,
  );

}

class _CustomCarouselBarState extends State<CustomCarouselBar> {
  final List images;
  final Color bgColor;
  final Function onTap;
  
  int _current = 0;
  var itens;


  _CustomCarouselBarState({
    this.images,
    this.bgColor,
    this.onTap,
  });

  @override
  void initState() {
  

    itens = map<Widget>(images, (index, url) {

      return Card(  
        
        margin: EdgeInsets.zero,
        child: Container(          
          width: double.infinity,          
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(              
              image: NetworkImage(url["image"],),
              fit: BoxFit.cover
            )
          ),
          child: FlatButton(
              onPressed: () { 
                if (onTap != null)
                  onTap(url["command"]); 
              },
              child: null,
              highlightColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
              splashColor: Colors.amberAccent,
          ),
        ),
        
        
        
      );
      


    });


    super.initState();

  }


  

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    
    //container principal
    return Container(
      height: screenSize.height * 0.3,
      color: bgColor,
      child: Stack(
        children: <Widget>[

          //background
          Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage((images[_current] as Map)["image"]),
                fit: BoxFit.cover
              )
            ),
            child: BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),                
              ),
            ),
          ),

          //2
          CustomPaint(
            child: Container(),
            painter: _CurvePainter(color: bgColor),
          ),

          //slider + indicator
          Container(
            padding: EdgeInsets.zero,            
            margin: EdgeInsets.only(left: MyGlobals.marginLeft, right: MyGlobals.marginRight, bottom: 5, top: screenSize.height * 0.115),
            child: Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.expand,
              children: [
                
                CarouselSlider(
                  items: itens,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  height: screenSize.height * 0.195,
                  pauseAutoPlayOnTouch: Duration(seconds: 3),
                  viewportFraction: 1.0,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                
                
                //indicator
                Positioned(                  
                  bottom: 7,
                  width: images.length * 15.0,
                  child: Container(
                    height: 15,                    
                    decoration: BoxDecoration(
                      color:Colors.black26,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: map<Widget>(images, (index, url) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric( horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index ? Color.fromRGBO(255, 0, 0, 0.9) : Color.fromRGBO(255, 255,255, 0.9)
                          ),
                        );
                      }),
                    ),
                  ),
                )
              
              ]
            ),
            
          ),
          
        ],
      ),
    );


  }

  
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }



}

class _CurvePainter extends CustomPainter {
  
  //ref: https://medium.com/flutter-community/paths-in-flutter-a-visual-guide-6c906464dcd0

  final Color color;

  _CurvePainter({this.color});


  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
    ..color = color
    //..style = PaintingStyle.fill
    ..strokeWidth = 8.0;
    
    Path path;
    
    path = Path();
    path.moveTo(0, size.height /1.3);
    path.quadraticBezierTo(size.width/2 , size.height, size.width, size.height /1.3);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  // @override
  // bool shouldRepaint(CustomPainter oldDelegate) {
  //   return oldDelegate != this;
  // }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}