// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telas/pages/widgets/frosted_item_appbar.dart';
import 'package:telas/utils/constants.dart';
import 'package:telas/utils/styles.dart';

const Cubic _kAccelerateCurve = Cubic(0.548, 0.0, 0.757, 0.464);
const Cubic _kDecelerateCurve = Cubic(0.23, 0.94, 0.41, 1.0);
const double _kPeakVelocityTime = 0.248210;
const double _kPeakVelocityProgress = 0.379146;

class _FrontLayer extends StatelessWidget {
  const _FrontLayer({
    Key key,
    this.onTap,
    this.child,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,
      color: kBackdropAbaColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0), 
          topRight: Radius.circular(16.0)
        ),
        side: BorderSide(color: kBackdropAbaBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Container(              
              height: 30.0,
              alignment: AlignmentDirectional.centerStart,
            ),
          ),
          Expanded(
            child: Padding(
              padding: kBackdropFrontPadding,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

}

class _BackdropTitle extends AnimatedWidget {
  final Function onPress;
  final Widget frontTitle;
  final Widget backTitle;

  const _BackdropTitle({
    Key key,
    Listenable listenable,
    this.onPress,
    @required this.frontTitle,
    @required this.backTitle,
  })  : assert(frontTitle != null),
        assert(backTitle != null),
        super(key: key, listenable: listenable);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = CurvedAnimation(
      parent: this.listenable,
      curve: Interval(0.0, 0.78),
    );

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                
                // AnimatedCrossFade(
                //   crossFadeState: (animation.status == AnimationStatus.completed || animation.status == AnimationStatus.forward)
                //     ? CrossFadeState.showFirst
                //     : CrossFadeState.showSecond,
                //   duration: Duration(milliseconds: 300),
                //   firstChild: frontTitle,
                //   secondChild: backTitle,
                // ),

                Opacity(
                  opacity: CurvedAnimation(
                    parent: ReverseAnimation(animation),
                    curve: Interval(0.5, 1.0),
                  ).value,
                  child: FractionalTranslation(
                    translation: Tween<Offset>(
                      begin: Offset.zero,
                      end: Offset(0.5, 0.0),
                    ).evaluate(animation),
                    child: Container(child: backTitle),
                  ),
                ),
                
                Opacity(
                  opacity: CurvedAnimation(
                    parent: animation,
                    curve: Interval(0.5, 1.0),
                  ).value,
                  child: FractionalTranslation(
                    translation: Tween<Offset>(
                      begin: Offset(-0.25, 0.0),
                      end: Offset.zero,
                    ).evaluate(animation),
                    child: frontTitle,
                  ),
                ),

                
              
              ],
            )
          
          ]
        ),
      ),
    );
  }

}


class Backdrop extends StatefulWidget {
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;
  final List<Widget> actions;
  final String imagePath;

  const Backdrop({
    @required this.frontLayer,
    @required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
    @required this.imagePath,
    this.actions = const <Widget>[],
  })  : assert(frontLayer != null),
        assert(backLayer != null),
        assert(frontTitle != null),
        assert(backTitle != null);

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop> with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  AnimationController _controller;
  Animation<RelativeRect> _layerAnimation;
  Size _sreenSize;
  MediaQueryData _mediaQuery;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
      value: 1.0,
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

  void _toggleBackdropLayerVisibility() {
    // Call setState here to update layerAnimation if that's necessary
    setState(() {
      _frontLayerVisible ? _controller.reverse() : _controller.forward();
    });
  }

  // _layerAnimation animates the front layer between open and close.
  // _getLayerAnimation adjusts the values in the TweenSequence so the
  // curve and timing are correct in both directions.
  Animation<RelativeRect> _getLayerAnimation(Size layerSize, double layerTop) {
    Curve firstCurve; // Curve for first TweenSequenceItem
    Curve secondCurve; // Curve for second TweenSequenceItem
    double firstWeight; // Weight of first TweenSequenceItem
    double secondWeight; // Weight of second TweenSequenceItem
    Animation animation; // Animation on which TweenSequence runs

    if (_frontLayerVisible) {
      firstCurve = _kAccelerateCurve;
      secondCurve = _kDecelerateCurve;
      firstWeight = _kPeakVelocityTime;
      secondWeight = 1.0 - _kPeakVelocityTime;
      animation = CurvedAnimation(
        parent: _controller.view,
        curve: Interval(0.0, 0.78),
      );
    } else {
      // These values are only used when the controller runs from t=1.0 to t=0.0
      firstCurve = _kDecelerateCurve.flipped;
      secondCurve = _kAccelerateCurve.flipped;
      firstWeight = 1.0 - _kPeakVelocityTime;
      secondWeight = _kPeakVelocityTime;
      animation = _controller.view;
    }

    return TweenSequence(
      <TweenSequenceItem<RelativeRect>>[
        TweenSequenceItem<RelativeRect>(
          tween: RelativeRectTween(
            begin: RelativeRect.fromLTRB(
              0.0,
              layerTop,
              0.0,
              layerTop - layerSize.height,
            ),
            end: RelativeRect.fromLTRB(
              0.0,
              layerTop * _kPeakVelocityProgress,
              0.0,
              (layerTop - layerSize.height) * _kPeakVelocityProgress,
            ),
          ).chain(CurveTween(curve: firstCurve)),
          weight: firstWeight,
        ),
        TweenSequenceItem<RelativeRect>(
          tween: RelativeRectTween(
            begin: RelativeRect.fromLTRB(
              0.0,
              layerTop * _kPeakVelocityProgress,
              0.0,
              (layerTop - layerSize.height) * _kPeakVelocityProgress,
            ),
            end: RelativeRect.fill,
          ).chain(CurveTween(curve: secondCurve)),
          weight: secondWeight,
        ),
      ],
    ).animate(animation);
  }



  @override
  Widget build(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    _sreenSize = _mediaQuery.size;
    

    return Stack(      
      children: <Widget>[

        Container(
          color: kBackdropBackBgColor,
          height: _sreenSize.height,
          width: _sreenSize.width,
        ),

        Container(
          height: _sreenSize.height * kBackdropHeaderFactor,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.0),
                  Color.fromRGBO(0, 0, 0, 0.8)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter
              )
            ),
          ),
        ),

        Column(
          children: <Widget>[

            //AppBar
            Container(
              height: (_sreenSize.height * kBackdropHeaderFactor) - 16,
              child: Column(
                children: <Widget>[

                  //statusbar
                  Container(
                    height: _mediaQuery.padding.top,
                  ), 

                  //toolbar
                  Container(
                    height: kToolbarHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        //leading
                        Container(
                          child: FrostedItemAppbar(
                            position: FrostedItemEdgePosition.left,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back, size: 24, color: Colors.white),
                              color: Theme.of(context).accentColor,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ),

                        //space
                        Expanded(child: Container(),),

                        //actions
                        Container(
                          child: Row(
                            children: <Widget>[
                              
                              ...widget.actions,

                              FrostedItemAppbar(
                                position: (widget.actions.length > 0)
                                  ? FrostedItemEdgePosition.none 
                                  : FrostedItemEdgePosition.right,
                                child: IconButton(
                                  icon: AnimatedIcon(
                                    icon: AnimatedIcons.close_menu,
                                    progress: _controller,
                                  ),
                                  color: Colors.white,
                                  onPressed: _toggleBackdropLayerVisibility
                                ),
                              )
                              
                              
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  
                  //title
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,  
                        crossAxisAlignment: CrossAxisAlignment.center,                    
                        children: <Widget>[
                          
                          _BackdropTitle(
                            listenable: _controller.view,
                            onPress: _toggleBackdropLayerVisibility,
                            frontTitle: widget.frontTitle,
                            backTitle: widget.backTitle,
                          ),
                          
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),

            //body
            Expanded(
               child: LayoutBuilder(
                 builder: _buildStack,
               ),
             ),
            
          ],
        )



      ],
    );


    // original
    ///////////////////////////////////////////////////////////////
    var appBar = AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      titleSpacing: 0.0,
      title: _BackdropTitle(
        listenable: _controller.view,
        onPress: _toggleBackdropLayerVisibility,
        frontTitle: widget.frontTitle,
        backTitle: widget.backTitle,
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
        color: Theme.of(context).accentColor,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[

        IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _controller,
            ),
            color: Colors.white,
            onPressed: _toggleBackdropLayerVisibility),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: LayoutBuilder(
        builder: _buildStack,
      ),
    );

  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double layerTitleHeight = kBackdropAbaOffset; //30.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTitleHeight;
    _layerAnimation = _getLayerAnimation(layerSize, layerTop);

    return Stack(      
      key: _backdropKey,
      children: <Widget>[
        widget.backLayer,
        PositionedTransition(
          rect: _layerAnimation,
          child: _FrontLayer(
            onTap: _toggleBackdropLayerVisibility,
            child: widget.frontLayer,
          ),
        ),
      ],
    );
  }

}
