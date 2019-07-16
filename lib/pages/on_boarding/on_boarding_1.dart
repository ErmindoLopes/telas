import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telas/pages/widgets/on_boarding_pg_content.dart';

class OnBoarding1 extends StatefulWidget {
  @override
  _OnBoarding1State createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  
  PageController _controller; 
  int _actualPage = 0;
  

  List<Widget> pages = [
    OnBoardingPgContent(
      title: "WELCOME",
      subtitle: "Exemplo de Telas onboarding\nLinha2 Linha2 Linha2 ",
      image: "assets/images/intro_img_1.png",          
    ),
    OnBoardingPgContent(
      title: "DISCOVER SCREENS",
      subtitle: "Exemplo de Telas onboarding\nLinha2 Linha2 Linha2 ",
      image: "assets/images/intro_img_2.png",          
    ),
    OnBoardingPgContent(
      title: "ADD TO PROJECT",
      subtitle: "Exemplo de Telas onboarding\nLinha2 Linha2 Linha2 ",
      image: "assets/images/intro_img_3.png",          
    ),
    OnBoardingPgContent(
      title: "BE HAPPPPPPY",
      subtitle: "Exemplo de Telas onboarding\nLinha2 Linha2 Linha2 ",
      image: "assets/images/intro_img_4.png",          
    ),
  ];
 
  @override
  void initState() {
    super.initState();

    _controller = new PageController( initialPage: _actualPage );
    
  }

  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }


  Widget _buildUI() {
  
    return Scaffold(
      backgroundColor: Color(0xffcccccc),      
      body: _buildBody(),      
    );

  }


  Widget _buildBody(){
    
    return Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.loose,
      children: <Widget>[
        
        PageView.builder(
          controller: _controller,
          itemCount: pages.length,
          itemBuilder: (context, position) => pages[position],
          onPageChanged: _pageChanged,
        ),

        Container(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              MaterialButton(
                minWidth: 100,
                child: _actualPage != pages.length-1
                 ? Text("PULAR")
                 :  Text("     "),
                onPressed: _actualPage != pages.length-1
                 ? _skip
                 : null,
              ),

              Expanded(
                child: createDots(),// indicator
              ),

              MaterialButton(
                minWidth: 100,
                child: _actualPage != pages.length-1
                 ? Text("PRÓXIMO")
                 :  Text("OK"),
                onPressed: _actualPage != pages.length-1
                 ? _next
                 : _skip,
              ),

            ],
          ),
        )

      ],
      
    );

  }

  Widget createDots(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.generate(
        pages.length, 
        (int index){
          return Container(
            height: 4,
            width: 10,
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: _actualPage == index
               ? Colors.redAccent
               : Colors.grey,
              borderRadius: BorderRadius.circular(4)
            ),
          );
        }
      ),
    );
  }

  void _skip(){

    Navigator.of(context).pop();

  }

  void _next(){
    
    _controller.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut
    );

  }

  void _pageChanged(int page){

    setState(() {
      _actualPage = page;
    });

  }


}

