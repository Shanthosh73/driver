import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class Friend extends StatefulWidget {
  const Friend({super.key});

  @override
  State<Friend> createState() => _FriendState();
}

void _launchWhatsApp() async {
  final url = 'https://api.whatsapp.com/send?phone=YOUR_PHONE_NUMBER';
  if (await canLaunch(url)) {
    await launch(url);
  } else {}
}

void _launchMessenger() async {
  final url = 'https://www.messenger.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {}
}

void _launchInstagram() async {
  final url = 'https://www.instagram.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {}
}

void _copyLink() {
  Clipboard.setData(ClipboardData(text: 'https://example.com'));
}

class _FriendState extends State<Friend> {
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
          title: const Text(
            "Invite Friend",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        body: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      height: 30,
                      alignment: Alignment.topLeft,
                      child: const Text("Refer & Earn",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            height: 70,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "You Earn \$15 your friend gets 40% offer on first booking",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              maxLines: 7,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 50,
                            child: Image.asset(
                              'assets/invite/gift.png',
                              scale: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: 30,
                alignment: Alignment.topLeft,
                child: const Text("Invite",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black)),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: _launchWhatsApp,
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                height: 30,
                                child:
                                    Image.asset('assets/invite/whatsapp.png')),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 1),
                            height: 30,
                            alignment: Alignment.center,
                            child: const Text("Whatsapp",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: _launchInstagram,
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                height: 30,
                                child:
                                    Image.asset('assets/invite/instagram.png')),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 1),
                            height: 30,
                            alignment: Alignment.center,
                            child: const Text("Instagram",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: _launchMessenger,
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                height: 30,
                                child:
                                    Image.asset('assets/invite/messenger.png')),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 1),
                            height: 30,
                            alignment: Alignment.center,
                            child: const Text("Messenger",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: _copyLink,
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                height: 30,
                                child: Image.asset('assets/invite/link.png')),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 1),
                            height: 30,
                            alignment: Alignment.center,
                            child: const Text("Copy Link",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Divider(
                height: 30.0,
                thickness: 1.0,
                color: Colors.black,
                indent: 12.0,
                endIndent: 12.0,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 30,
                          alignment: Alignment.topLeft,
                          child: const Text("Suggested Contact",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 30,
                          alignment: Alignment.topRight,
                          child: const Text("View All",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(142, 142, 142, 1),
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 30,
                          alignment: Alignment.topLeft,
                          child: const Text("Jhonny Rios",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 30,
                          alignment: Alignment.topRight,
                          child: const Text("Invite",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 30,
                          alignment: Alignment.topLeft,
                          child: const Text("Manoj Kumar",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 30,
                          alignment: Alignment.topRight,
                          child: const Text("Invited",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(142, 142, 142, 1),
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ]));
  }
}
