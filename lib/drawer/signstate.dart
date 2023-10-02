import 'package:driver/drawer/allow.dart';
import 'package:driver/drawer/loginstate.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late bool _passwordVisible;
  bool? rememberMe = false;

  // void _onRememberMeChanged(bool? newValue) => setState(() {
  //   rememberMe = newValue;
  //   if (rememberMe!) {
  //     showSnackBar(context, "rememberMe");
  //   } else {
  //     showSnackBar(context, "don't remeber me");
  //   }
  // });

  @override
  void initState() {
    _passwordVisible = false;
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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(children: [
                    SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/qwiker/logo.png")),
                  ])),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  children: [
                    const Text(
                      "Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: const BoxDecoration(),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Full name',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2))),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: const BoxDecoration(),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Email',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2))),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: const BoxDecoration(),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  hintText: 'Phone Number',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2))),
                            ),
                          ),
                        ]),
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
                          horizontal: 100,
                          vertical: 30,
                        ),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(60)),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Loginstate()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 70,
                          vertical: 100,
                        ),
                        height: 50,
                        width: double.infinity,
                        child: const Text("Already have an account? Sign In"),
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
