import 'package:driver/screenapp/chat.dart';
import 'package:driver/screenapp/driverpayment.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Track extends StatefulWidget {
  final String address1;
  final String address2;

  Track(String selectedPayment,
      {required this.address1, required this.address2});

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  String selectedPayment = 'Payment Screen';

  void updateSelectedPayment(String paymentOption) {
    setState(() {
      selectedPayment = paymentOption;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: userLocation == null
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: userLocation!,
                      zoom: 15.0,
                    ),
                    markers: Set.from(markers),
                    polylines: {
                      if (polylineCoordinates.isNotEmpty)
                        Polyline(
                          polylineId: PolylineId('UserToTarget1'),
                          color: Colors.blue,
                          points: polylineCoordinates,
                          width: 3,
                        ),
                      if (targetLocation1 != null && targetLocation2 != null)
                        Polyline(
                          polylineId: PolylineId('Target1ToTarget2'),
                          color: Colors.red,
                          points: [targetLocation1!, targetLocation2!],
                          width: 3,
                        ),
                    },
                    onMapCreated: (controller) {
                      setState(() {
                        mapController = controller;
                      });
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 320,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(248, 248, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(35))),
                      child: Center(
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 15),
                                child: Text(
                                  "Your Driver will arrive in 3 mins",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: ListTile(
                                leading: Icon(Icons.account_circle_rounded,
                                    size: 40),
                                title: Text('Alex Robin'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Volkswagen'),
                                    Text('TN36AZ8182'),
                                  ],
                                ),
                                trailing: Wrap(
                                  spacing: 12,
                                  children: <Widget>[
                                    Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.black,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ChatScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 26,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: Icon(
                                          Icons.chat,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: ListTile(
                                title: Text(selectedPayment),
                                subtitle: Text("Change Payment Method"),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_forward),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Driverpayment(
                                            updateSelectedPayment),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Text("\$ 250",
                                          style: TextStyle(fontSize: 25)),
                                      Text("Price",
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 50),
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: Colors.red, width: 2),
                                    ),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
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
    carIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/car.png',
    );
  }

  void _drawPolylines() {
    polylineCoordinates.clear();
    polylineCoordinates.add(userLocation!);
    polylineCoordinates.add(targetLocation1!);
    polylineCoordinates.add(targetLocation2!);
    setState(() {});
  }
}
