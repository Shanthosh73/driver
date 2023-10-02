import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isChecked = (prefs.getBool('isChecked') ?? false);
    });
  }

  _saveData(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isChecked = value;
      prefs.setBool('isChecked', value);
    });
  }

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
          "Terms & Conditions",
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
                  'Terms & Conditions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'These Terms and Conditions constitute a legally binding agreement made between you, whether personally or on behalf of an entity (“you”) and TaxiCaller Nordic AB (”TaxiCaller”, “we,” “us” or “our”), concerning your access to and use of the taxicaller.com website as well as any other media form, media channel, mobile website or mobile application related, linked, or otherwise connected thereto (collectively, the “Site”). You agree that by accessing the Site, you have read, understood, and agree to be bound by all of these Terms and Conditions of Use. IF YOU DO NOT WISH TO BE BOUND BY THE THESE TERMS OF USE, PLEASE EXIT THE SITE NOW. YOUR REMEDY FOR DISSATISFACTION WITH THIS SITE, OR ANY PRODUCTS, SERVICES, CONTENT, OR OTHER INFORMATION AVAILABLE ON OR THROUGH THIS SITE, IS TO STOP USING THE SITE AND/OR THOSE PARTICULAR PRODUCTS OR SERVICES. YOUR AGREEMENT WITH US REGARDING COMPLIANCE WITH THESE TERMS OF USE BECOMES EFFECTIVE IMMEDIATELY UPON COMMENCEMENT OF YOUR USE OF THIS SITE.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
