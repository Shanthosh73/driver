import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
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
            "Notification",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                alignment: Alignment.topLeft,
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Color.fromRGBO(253, 253, 253, 1)),
                    ]),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("System",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Flexible(
                        child: Text(
                            "Your booking # 5445 has been succesfully registered"))
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                alignment: Alignment.topLeft,
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Color.fromRGBO(253, 253, 253, 1)),
                    ]),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Promotion",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Flexible(child: Text("Invite friends - Get 3 coupon each!"))
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                alignment: Alignment.topLeft,
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Color.fromRGBO(253, 253, 253, 1)),
                    ]),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("System",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Flexible(
                        child: Text(
                            "Your booking # 4453 has been succesfully completed"))
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                alignment: Alignment.topLeft,
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Color.fromRGBO(253, 253, 253, 1)),
                    ]),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Promotion",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Flexible(child: Text("Invite friends - Get 3 coupon each!"))
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                alignment: Alignment.topLeft,
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Color.fromRGBO(253, 253, 253, 1)),
                    ]),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("System",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Flexible(
                        child: Text(
                            "Thank You - Your transaction has successfully completed"))
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                alignment: Alignment.topLeft,
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Color.fromRGBO(253, 253, 253, 1)),
                    ]),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Promotion",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Flexible(child: Text("Invite friends - Get 3 coupon each!"))
                  ],
                )),
          ],
        ));
  }
}
