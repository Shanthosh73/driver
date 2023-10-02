import 'package:driver/screenapp/track.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Screen extends StatefulWidget {
  final String address1;
  final String address2;

  Screen({required this.address1, required this.address2});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String selectedPayment = '';
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  LatLng? targetLocation1;
  LatLng? targetLocation2;
  LatLng? userLocation;
  List<LatLng> polylineCoordinates = [];
  BitmapDescriptor? carIcon; // Custom car icon

  @override
  void initState() {
    super.initState();
    _getCoordinatesForAddress(widget.address1, 1);
    _getCoordinatesForAddress(widget.address2, 2);
    _getUserLocation();
    _createCustomMapMarker();
  }

  int selectedCarIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: targetLocation1 ?? LatLng(0, 0),
                zoom: 15.0,
              ),
              markers: markers,
              polylines: {
                if (polylineCoordinates
                    .isNotEmpty) // Check if polylineCoordinates is not empty
                  Polyline(
                    polylineId: PolylineId('UserToTarget1'),
                    color: Colors.blue,
                    points: polylineCoordinates,
                    width: 3,
                  ),
                if (targetLocation1 != null &&
                    targetLocation2 !=
                        null) // Check if target locations are not null
                  Polyline(
                    polylineId: PolylineId('Target1ToTarget2'),
                    color: Colors.red,
                    points: [targetLocation1!, targetLocation2!],
                    width: 3,
                  ),
              },
              onMapCreated: (controller) {
                mapController = controller;
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: const [
                      BoxShadow(color: Color.fromRGBO(248, 248, 255, 1)),
                    ]),
                child: Center(
                    child: ListView(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        alignment: Alignment.topLeft,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Available rides",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        )),
                    carContainer(0, "assets/car/car.png", "Alex Robin",
                        "4+1 Person", "Rs 150"),
                    carContainer(1, "assets/car/auto1.png", "Sathees",
                        "3+1 Person", "Rs 130"),
                    carContainer(2, "assets/car/bike.png", "Prabhu", "1 Person",
                        "Rs 100"),
                    carContainer(3, "assets/car/jeep.jpg", "Dinesh",
                        "3+1 Person", "Rs 170"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Track(
                                      selectedPayment,
                                      address1: '',
                                      address2: '',
                                    )));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 15,
                        ),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(60)),
                        child: const Text(
                          "Select Ride",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getCoordinatesForAddress(
      String address, int markerIndex) async {
    try {
      List<Location> locations = await locationFromAddress(address);

      if (locations.isNotEmpty) {
        Location location = locations.first;
        LatLng latLng = LatLng(location.latitude, location.longitude);

        setState(() {
          if (markerIndex == 1) {
            targetLocation1 = latLng;
          } else if (markerIndex == 2) {
            targetLocation2 = latLng;
          }

          markers.add(
            Marker(
              markerId: MarkerId('Marker$markerIndex'),
              position: latLng,
              infoWindow: InfoWindow(
                title: 'Marker Title',
                snippet: address,
              ),
            ),
          );

          polylineCoordinates.add(latLng);

          if (markerIndex == 1) {
            mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
          }
        });

        if (userLocation != null &&
            targetLocation1 != null &&
            targetLocation2 != null) {
          _drawPolylines();
        }
      }
    } catch (e) {
      print('Error fetching coordinates: $e');
    }
  }

  Future<void> _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        userLocation = LatLng(position.latitude, position.longitude);

        markers.add(
          Marker(
            markerId: MarkerId('UserLocation'),
            position: userLocation!,
            infoWindow: InfoWindow(
              title: 'Your Location',
              snippet: 'You are here',
            ),
          ),
        );
        if (targetLocation1 != null && targetLocation2 != null) {
          _drawPolylines();
        }
      });
    } catch (e) {
      print('Error fetching user location: $e');
    }
  }

  Future<void> _createCustomMapMarker() async {
    carIcon = BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/car.png',
    ) as BitmapDescriptor?;
  }

  void _drawPolylines() {
    polylineCoordinates.clear();
    polylineCoordinates.add(userLocation!);
    polylineCoordinates.add(targetLocation1!);
    polylineCoordinates.add(targetLocation2!);
    setState(() {});
  }

  Widget carContainer(int index, String imageAsset, String title,
      String subtitle, String price) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCarIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: selectedCarIndex == index ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ListTile(
          leading: Image.asset(imageAsset),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Text(price),
        ),
      ),
    );
  }
}
