import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatelessWidget {
  const Maps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Example'),
      ),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
      ),
    );
  }
}
