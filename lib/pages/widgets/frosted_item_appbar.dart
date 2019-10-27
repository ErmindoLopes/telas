import 'dart:ui';

import 'package:flutter/material.dart';

enum FrostedItemEdgePosition {
  left,
  right,
  none,
  all,
}

class FrostedItemAppbar extends StatelessWidget {
  
  final Widget child;
  final double radius;
  final double padding;
  final FrostedItemEdgePosition position;

  const FrostedItemAppbar({this.radius = 56, this.child, this.padding = 8, this.position = FrostedItemEdgePosition.left});

  @override
  Widget build(BuildContext context) {

    var height = kToolbarHeight; 
    var width = kToolbarHeight;
    var borderRadius;
    switch (position) {
      case FrostedItemEdgePosition.left:
        borderRadius = BorderRadius.only(
          topRight: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        );
        break;
      case FrostedItemEdgePosition.right:
        borderRadius = BorderRadius.only(
          topLeft: Radius.circular(radius),
          bottomLeft: Radius.circular(radius),
        );
        break;
      case FrostedItemEdgePosition.all:
        borderRadius = BorderRadius.circular(radius);
        break;
      case FrostedItemEdgePosition.none:
        borderRadius = BorderRadius.circular(0);
        break;
    }
      


    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(vertical: padding),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.3),
        borderRadius: borderRadius
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 10.0),
          child: Container(
            
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.5)
            ),
            child: Center(
              child: child
            ),
          ),
        ),
      ),
      

    );


  }
}
