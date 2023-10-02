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
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset("assets/allow/data.webp")),
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
                    margin: const EdgeInsets.only(top: 350),
                    alignment: Alignment.center,
                    height: 60,
                    width: 300,
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
    );
  }
}
