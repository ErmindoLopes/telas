
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage1 extends StatefulWidget {
  @override
  _MapsPage1State createState() => _MapsPage1State();
}

class _MapsPage1State extends State<MapsPage1> {
  
  Completer<GoogleMapController> _controller = Completer();

  List<MarkItem> itens;
  double zoomVal = 5.0;

  @override
  void initState() { 
    super.initState();

    itens = <MarkItem>[

      MarkItem(
        markerId: 'gramercy',
        latitude: 40.738380,
        longitude: -73.988426,
        infoTitle: 'Gramercy Tavern',
        hueColor: BitmapDescriptor.hueViolet,
      ),

      MarkItem(
        markerId: 'bernardin',
        latitude: 40.761421,
        longitude: -73.981667,
        infoTitle: 'Le Bernardin',
        hueColor: BitmapDescriptor.hueAzure,
      ),

      MarkItem(
        markerId: 'Qq Coisa',
        latitude: 40.742451,
        longitude: -74.005959,
        infoTitle: 'Qq Coisa',
        hueColor: BitmapDescriptor.hueGreen,
      ),

    ];

  }

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }


  Widget _buildUI() {
  
    return Scaffold(
      backgroundColor: Color(0xffe6e6e6),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );

  }


  AppBar _buildAppBar(){
    return AppBar(
        centerTitle: true,
        title: Text("Google Maps com Locations")
      );

  }


  Widget _buildBody(){
    
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        
        _buildGoogleMap(),

        _buildBtn(),

        _zoomMinusfunction(),

        _zoomPlusFunction(),

      ],      
    );

  }


  Widget _buildGoogleMap() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: itens
          .map((item){
            return Marker(
              markerId: MarkerId(item.markerId),
              position: LatLng(item.latitude, item.longitude),
              infoWindow: InfoWindow(title: item.infoTitle),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                item.hueColor
              )
            );
          })
          .toSet(),
      ),
    );
  }

  Widget _buildBtn(){
    return MaterialButton(
      color: Colors.blueGrey,
      child: Text("Botao"),
      onPressed: (){
        _gotoLocation(-23.5626, -46.6381);
      },
    );
  }

  Widget _zoomMinusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
            icon: Icon(Icons.zoom_out, color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal--;
             _minus( zoomVal);
            }),
    );
 }
 Widget _zoomPlusFunction() {
   
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
            icon: Icon(Icons.zoom_in,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal++;
              _plus(zoomVal);
            }),
    );
 }




  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 10, tilt: 50.0,
      bearing: 45.0,)));
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(-23.5626, -46.6381), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(-23.5626, -46.6381), zoom: zoomVal)));
  }


}


class MarkItem {

  final String markerId;
  final double latitude;
  final double longitude;
  final String infoTitle;
  final double hueColor;

  MarkItem({this.markerId, this.latitude, this.longitude, this.infoTitle, this.hueColor});
  
  
}
