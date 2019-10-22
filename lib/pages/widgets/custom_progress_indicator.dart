import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color color;
  

  CustomProgressIndicator({this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SpinKitRipple(color: color);


    // return SpinKitRotatingCircle(color: color);
    // return SpinKitRotatingPlain(color: color);
    // return SpinKitChasingDots(color: color);
    // return SpinKitPumpingHeart(color: color);
    // return SpinKitPulse(color: color);
    // return SpinKitDoubleBounce(color: color);
    // return SpinKitThreeBounce(color: color);
    // return SpinKitWanderingCubes(color: color);
    // return SpinKitCircle(color: color);
    // return SpinKitFadingFour(color: color);
    // return SpinKitFadingCube(color: color);
    // return SpinKitFoldingCube(color: color);
    // return SpinKitRing(color: color);
    // return SpinKitDualRing(color: color);
    // return SpinKitRipple(color: color);
    // return SpinKitFadingGrid(color: color);
    // return SpinKitHourGlass(color: color);
    // return SpinKitSpinningCircle(color: color);
    // return SpinKitFadingCircle(color: color);
    // return SpinKitPouringHourglass(color: color);
    // return SpinKitCubeGrid(size: 51.0, color: color);
    // return SpinKitWave(color: color, type: SpinKitWaveType.start);
    // return SpinKitWave(color: color, type: SpinKitWaveType.center);
    // return SpinKitWave(color: color, type: SpinKitWaveType.end);
    // return SpinKitWanderingCubes(color: color, shape: BoxShape.circle);
    // return SpinKitFadingFour(color: color, shape: BoxShape.rectangle);
    // return SpinKitFadingGrid(color: color, shape: BoxShape.rectangle);
    // return SpinKitSpinningCircle(color: color, shape: BoxShape.rectangle);






  }
}

