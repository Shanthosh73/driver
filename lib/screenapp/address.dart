import 'package:driver/screenapp/select.dart';
import 'package:driver/screenapp/track.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  late Stream<Position> _locationStream;
  TextEditingController addressController1 = TextEditingController();
  TextEditingController addressController2 = TextEditingController();
  String _locationText = "Getting location...";

  late SharedPreferences _prefs;
  bool _showNewContainer = false;
  bool _switchValue = true;
  bool _switchValue1 = false;
  bool _switchValue2 = false;

  @override
  void initState() {
    super.initState();
    _startLocationTracking();
  }

  void _startLocationTracking() {
    _locationStream = Geolocator.getPositionStream();
    _locationStream.listen((Position position) async {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final placemark = placemarks.first;
      setState(() {
        _locationText = " ${placemark.street}, ${placemark.locality},";
      });
    });
  }

  void closeContainer() {
    setState(() {
      _showNewContainer = false;
    });
  }

  void _handleChange(String newName) {
    setState(() {
      _switchValue1 = newName.isNotEmpty;
    });
  }

  void _handlelocationChange(String newName) {
    setState(() {
      _switchValue2 = newName.isNotEmpty;
    });
  }

  Future<void> _Navigatetonext() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Screen(
          address1: addressController1.text,
          address2: addressController2.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 1),
                  child: Transform.rotate(
                    angle: 3.14 / 2,
                    child: CupertinoSwitch(
                      activeColor: Colors.blue,
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text(
                    '2.30 pm',
                    style: TextStyle(color: Color.fromRGBO(199, 199, 199, 1)),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                        ),
                      ]),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    alignment: Alignment.topLeft,
                    child: Text(_locationText,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 28),
              child: DottedLine(
                  direction: Axis.vertical,
                  lineLength: 50,
                  lineThickness: 2.0,
                  dashLength: 5.0,
                  dashColor: _switchValue
                      ? Colors.blue
                      : Color.fromRGBO(199, 199, 199, 1)),
            ),
            Row(
              children: [
                Transform.rotate(
                  angle: 3.14 / 2,
                  child: CupertinoSwitch(
                    activeColor: Colors.blue,
                    value: _switchValue1,
                    onChanged: (value) {
                      setState(() {
                        _switchValue1 = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text(
                    '3.00 pm',
                    style: TextStyle(color: Color.fromRGBO(199, 199, 199, 1)),
                  ),
                ),
                Container(
                  height: 40,
                  width: 220,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(),
                  child: TextFormField(
                    controller: addressController1,
                    onChanged: _handleChange,
                    decoration: const InputDecoration(
                        labelText: 'Enter Address 1',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2))),
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        _showNewContainer = true;
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                if (_showNewContainer)
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 28),
                    child: DottedLine(
                        direction: Axis.vertical,
                        lineLength: 50,
                        lineThickness: 2.0,
                        dashLength: 5.0,
                        dashColor: _switchValue1
                            ? Colors.blue
                            : Color.fromRGBO(199, 199, 199, 1)),
                  ),
              ],
            ),
            Row(
              children: [
                if (_showNewContainer)
                  Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Transform.rotate(
                            angle: 3.14 / 2,
                            child: CupertinoSwitch(
                              activeColor: Colors.blue,
                              value: _switchValue2,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue2 = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(2),
                            child: Text(
                              '3.30 pm',
                              style: TextStyle(
                                  color: Color.fromRGBO(199, 199, 199, 1)),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 220,
                            alignment: Alignment.center,
                            // margin: const EdgeInsets.symmetric(
                            //     horizontal: 20, vertical: 15),
                            decoration: const BoxDecoration(),
                            child: TextFormField(
                              controller: addressController2,
                              onChanged: _handlelocationChange,
                              decoration: const InputDecoration(
                                  labelText: 'Enter Address 2',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2))),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: const Icon(Icons.clear_rounded),
                              color: Colors.black,
                              onPressed: closeContainer,
                            ),
                          )
                        ],
                      ))
              ],
            ),
            Row(
              children: [
                if (_showNewContainer)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      'Now you can add multiple stops',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(199, 199, 199, 1)),
                    ),
                  )
              ],
            ),
            InkWell(
              onTap: () {
                _Navigatetonext();
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.centerLeft,
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blueAccent,
                          ),
                        ]),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      alignment: Alignment.center,
                      child: Text("Next",
                          style: TextStyle(fontSize: 22, color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
