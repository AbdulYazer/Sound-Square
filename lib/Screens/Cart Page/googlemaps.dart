import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsWidget extends StatelessWidget {
  GoogleMapsWidget({super.key});
  late GoogleMapController _controller;
  static const CameraPosition _defaultLocation =
      CameraPosition(target: LatLng(9.6982124, 76.7583488));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:  [
          GoogleMap(
            onMapCreated: (controller)=> _controller = controller,
            mapType: MapType.normal,
            initialCameraPosition: _defaultLocation,
            ),
        ],
      ),
    );
  }
}
