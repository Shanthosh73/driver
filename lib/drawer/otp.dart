import 'package:driver/drawer/allow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  TextEditingController pinonecontroller = TextEditingController();

  onenter() {
    setState(() {
      print(pinonecontroller.text);
    });
  }

  @override
  void initState() {
    onenter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 180),
                child: Column(
                  children: [
                    const Text(
                      "Enter verification code",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      child: const Text(
                        "A code has been sent to +91 4545857812",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.white,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            controller: pinonecontroller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2),
                                )),
                          ),
                        ),
                        Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.white,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2),
                                )),
                          ),
                        ),
                        Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.white,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2),
                                )),
                          ),
                        ),
                        Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.white,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: const Text(
                        "Don't receive a code? Resend",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllowLocation()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 30,
                        ),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(40)),
                        child: const Text(
                          "Verify now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
