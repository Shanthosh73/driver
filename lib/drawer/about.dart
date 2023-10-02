import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
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
            "About",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 140),
                child: const Column(
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'After the arrival of  Qwiker, we saw the On-Demand Economy booming and now there is an Qwiker-like app for everything that we can imagine. Over time, some other Uber-like transportation apps started making their entrance into the market. And, guess what? They also reached the pinnacle of success while competing with ride-sharing giant Qwiker',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
