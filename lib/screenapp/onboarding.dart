import 'package:driver/drawer/loginstate.dart';
import 'package:flutter/material.dart';

import 'package:flutter_image_slider/carousel.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

final _formKey = GlobalKey<FormState>();

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 390,
                    width: 330,
                    child: Carousel(
                      indicatorBarColor: Colors.white.withOpacity(0.2),
                      autoScrollDuration: const Duration(seconds: 1),
                      animationPageDuration: const Duration(milliseconds: 500),
                      activateIndicatorColor: Colors.black,
                      animationPageCurve: Curves.easeInOut,

                      stopAtEnd: true,
                      autoScroll: true,
                      // widgets
                      items: [
                        Container(
                            child: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                alignment: Alignment.center,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Accept a job",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )),
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                        "assets/onboarding/onboarding1.png")
                                  ],
                                )),
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                alignment: Alignment.center,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Tracking Realtime",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )),
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                        "assets/onboarding/onboarding2.png")
                                  ],
                                )),
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                alignment: Alignment.center,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Earn Money",
                                        style: TextStyle(
                                            fontSize: 27,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )),
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                        "assets/onboarding/onboarding3.png")
                                  ],
                                )),
                          ],
                        ))
                      ],
                    )),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Loginstate()));
                  },
                  child: Container(
                      margin: const EdgeInsets.only(top: 150),
                      alignment: Alignment.center,
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(60)),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
