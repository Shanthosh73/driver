import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dotted_line/dotted_line.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
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
            "History",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                      height: 30,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Completed",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
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
                          margin: EdgeInsets.all(20),
                          child: Text(
                            ' Gobi',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
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
                          lineLength: 30,
                          lineThickness: 2.0,
                          dashLength: 5.0,
                          dashColor: _switchValue
                              ? Colors.blue
                              : Color.fromRGBO(199, 199, 199, 1)),
                    ),
                    Row(
                      children: [
                        Container(
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
                          margin: EdgeInsets.all(20),
                          child: Text(
                            ' Erode',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ));
  }
}
