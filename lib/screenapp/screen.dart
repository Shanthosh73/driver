import 'dart:io';

import 'package:driver/drawer/about.dart';
import 'package:driver/drawer/invite.dart';
import 'package:driver/drawer/makecomplaints.dart';
import 'package:driver/drawer/myaccount.dart';
import 'package:driver/drawer/notification.dart';
import 'package:driver/drawer/terms.dart';
import 'package:driver/screenapp/address.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Account extends StatefulWidget {
  final Map<String, dynamic> data;

  Account({required this.data});
  @override
  State<Account> createState() => _AccountState();
}

@override
bool _toggleValue = false;

class _AccountState extends State<Account> {
  GoogleMapController? mapController;
  LatLng? userLocation;
  String? userAddress;

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      // Permission granted, fetch and set user's current location and address
      await getCurrentLocation();
    } else if (status.isDenied) {
      // Permission denied
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied
    }
  }

  Future<void> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    final latitude = position.latitude;
    final longitude = position.longitude;

    // Use Geolocator and Geocoding to get the user's address
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    final Placemark place = placemarks[0];

    setState(() {
      userLocation = LatLng(latitude, longitude);
      userAddress =
          "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
    });
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: userLocation == null
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  onMapCreated: onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: userLocation!,
                    zoom: 17.0,
                  ),
                  markers: Set<Marker>.of([
                    Marker(
                      markerId: MarkerId('user_location'),
                      position: userLocation!,
                      infoWindow: InfoWindow(title: 'User Location'),
                    ),
                  ]),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(248, 248, 255, 1),
                          ),
                        ]),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 18),
                            child: Text("Where do you want to go?",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Container(
                            height: 30,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.white,
                                      ),
                                    ]),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 15),
                                  alignment: Alignment.topLeft,
                                  child: Text("  $userAddress",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NextScreen()));
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 1, vertical: 10),
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.white,
                                        ),
                                      ]),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 15),
                                    alignment: Alignment.topLeft,
                                    child: Text("Search Destination",
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                ), //BoxDecoration
                child: ListView(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: widget.data['imagePath'] != null
                          ? FileImage(File(widget.data['imagePath']))
                          : null,
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${widget.data['name']}',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )),
            ListTile(
              title: const Text('My Account '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Myaccount(
                              data: {},
                            )));
              },
            ),
            ListTile(
              title: const Text('Invite Friends'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Invite()));
              },
            ),
            ListTile(
              title: const Text('Favourites'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('FAQ'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('SOS'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Make Complaints'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Makecomplaints()));
              },
            ),
            ListTile(
              title: const Text('Notification'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications()));
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const About()));
              },
            ),
            ListTile(
              title: const Text('Privacy'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Terms & Conditions"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Terms()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ), //Drawer
    );
  }
}
