// ignore_for_file: unnecessary_null_comparison, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Position? _currentPosition;
  late GoogleMapController _controller;
  final List<Marker> _locationMarkers = []; // List for location markers
  final List<Marker> _eventMarkers = []; // List for event markers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentPosition != null)
              Expanded(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      _currentPosition!.latitude,
                      _currentPosition!.longitude,
                    ),
                    zoom: 16.0,
                  ),
                  markers: <Marker>{
                    ..._locationMarkers,
                    ..._eventMarkers
                  }, // Combine both marker lists
                ),
              ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add a new location to the list
                    _addLocation();
                  },
                  child: const Text("Add Location"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true,
      ).then((Position? position) {
        setState(() {
          _currentPosition = position;
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      print("Location permission denied");
    }
  }

  void _addLocation() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      // Get the current location
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true,
      );

      if (position != null) {
        // Create a new marker for the location
        Marker newMarker = Marker(
          markerId: MarkerId(
              DateTime.now().toString()), // Unique marker ID based on timestamp
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(
            title: "Location ${_locationMarkers.length + 1}", // Location number
          ),
        );

        setState(() {
          // Add the new marker to the location markers list
          _locationMarkers.add(newMarker);
        });
      }
    } else {
      print("Location permission denied");
    }
  }
}
