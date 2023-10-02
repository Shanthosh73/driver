import 'package:flutter/material.dart';

class Makecomplaints extends StatefulWidget {
  const Makecomplaints({super.key});

  @override
  State<Makecomplaints> createState() => _MakecomplaintsState();
}

class _MakecomplaintsState extends State<Makecomplaints> {
  // String _Selectedvalue;

  @override
  Widget build(BuildContext context) {
    List<String> myItems = [
      'Vehicles not clean',
      'Arrived at late ',
      'Driver is consuming alcohol',
      'Vehicles has no maintanence',
    ];
    String selectedItem;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromRGBO(248, 248, 255, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
          bottomOpacity: 0,
          elevation: 0,
          title: const Text(
            "Make Complaints",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(children: [
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/complaints/oip.jpeg")),
              ]),
            ),
            Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: const BoxDecoration(),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText:
                            'Write your complaint here(minimum of 10 characters)',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1))),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 90,
                      vertical: 30,
                    ),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(60)),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    )),
              ],
            )
          ],
        ));
  }
}
