import 'package:flutter/material.dart';

class OnBoardingPgContent extends StatelessWidget {
  
  final String title;
  final String subtitle;
  final String image;


  OnBoardingPgContent({ this.title, this.subtitle, this.image });

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    
    return SingleChildScrollView(
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15,),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontFamily: "sans-serif",
                fontWeight: FontWeight.bold,
                color: Color(0xff37474F),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "sans-serif",
                color: Color(0xff666666)
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            Container(
              height: 250,
              width: 250,
              margin: EdgeInsets.only(top: 50, bottom: 35),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                )
              ),
            )
            
          ],
        ),
        
      ),
    );
  }
}