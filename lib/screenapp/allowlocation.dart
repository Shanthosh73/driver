import 'package:driver/screenapp/screen.dart';
import 'package:flutter/material.dart';

class AllowLocation extends StatefulWidget {
  const AllowLocation({super.key});

  @override
  State<AllowLocation> createState() => _AllowLocationState();
}

class _AllowLocationState extends State<AllowLocation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.asset("assets/allow/download.png")),
                        const Text(
                          " Don't worry your data is private",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Account(
                                    data: {},
                                  )));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 350,
                      ),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(60)),
                      child: const Text(
                        "Allow Location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
