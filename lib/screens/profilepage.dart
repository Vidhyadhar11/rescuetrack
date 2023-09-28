// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User Profile"),
          backgroundColor: Colors.blue,
        ),
        body: const UserProfile(),
      ),
    );
  }
}

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Position? _currentPosition;
  late GoogleMapController _controller;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        // Top Banner
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: SingleChildScrollView(
            child: Container(
              color: const Color.fromARGB(255, 0, 0, 0),
              width: screenWidth,
              height: screenHeight * 0.25,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        "assets/images/Screenshot 2023-09-14 224446.png"),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Mobile Number",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Current Role",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Middle Widget - Google Maps
        // Replace YOUR_API_KEY with your actual Google Maps API key
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screenWidth,
            height: screenHeight * 0.4,
            child: _currentPosition != null
                ? GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        _currentPosition!.latitude,
                        _currentPosition!.longitude,
                      ),
                      zoom: 16.0,
                    ),
                    markers: _markers,
                  )
                : const Center(
                    child:
                        CircularProgressIndicator()), // Show loading indicator while fetching location
          ),
        ),

        // Bottom Contact Support and Help Buttons
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () {
                    // Implement email support functionality
                  },
                ),
                const Text("Contact Support"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.help),
                  onPressed: () {
                    // Implement help functionality
                  },
                ),
                const Text("Help"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
    _addMarker();
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

  void _addMarker() {
    if (_currentPosition != null) {
      Marker newMarker = Marker(
        markerId: const MarkerId("currentLocation"),
        position: LatLng(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
        ),
        infoWindow: const InfoWindow(
          title: "Current Location",
        ),
      );

      setState(() {
        _markers.add(newMarker);
      });
    }
  }
}
