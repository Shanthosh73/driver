import 'package:driver/drawer/invitefriend.dart';
import 'package:flutter/material.dart';

class Invite extends StatefulWidget {
  const Invite({super.key});

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
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
          "Invite Friends",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 120),
            child: Column(
              children: [
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      "assets/invite/1.jpg",
                      scale: 3,
                    )),
                const Text(
                  "Invite Friends",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                alignment: AlignmentDirectional.centerStart,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 00),
                child: const Text(
                  "Share your invite code",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey,
                ),
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'AVB2454',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Friend()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 90,
                        vertical: 30,
                      ),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(60)),
                      child: const Text(
                        "Invite",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ]),
      ]),
    );
  }
}
