import 'package:driver/drawer/otp.dart';
import 'package:driver/drawer/signstate.dart';
import 'package:flutter/material.dart';

class Loginstate extends StatefulWidget {
  const Loginstate({super.key});

  @override
  State<Loginstate> createState() => _LoginState();
}

class _LoginState extends State<Loginstate> {
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
                        horizontal: 20, vertical: 26),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.asset("assets/qwiker/logo.png")),
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 150, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                          ),
                        ),
                        const Text(
                          "Login with your phone number",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    decoration: const BoxDecoration(),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Phone Number',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const otp()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 30,
                      ),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(60)),
                      child: const Text(
                        "send code",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  // ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 70,
                        vertical: 110,
                      ),
                      height: 70,
                      width: double.infinity,
                      child: const Text("Don't have an account? Sign Up Here"),
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
