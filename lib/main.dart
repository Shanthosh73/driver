import 'dart:async';


import 'package:driver/drawer/loginstate.dart';
import 'package:driver/drawer/signstate.dart';
import 'package:driver/screenapp/onboarding.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(
    imagePath: '',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required String imagePath});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => const Onboarding(),
        '/Signup': (context) => const Signup(),
        '/login': (context) => Loginstate(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var timer = Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
    super.initState();
  }

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
                            width: 220,
                            child: Image.asset("assets/qwiker/logo.png")),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 500,
                            width: double.infinity,
                            child: Image.asset("assets/car/imgs.png")),
                      ],
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
