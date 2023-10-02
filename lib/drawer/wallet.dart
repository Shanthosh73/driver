import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String selectedPayment = "Paytm";

  void _showLanguageModalBottomSheet() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Choose Payment',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      RadioListTile(
                        title: Text('Google Pay'),
                        value: 'Google Pay',
                        groupValue: selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            selectedPayment = value as String;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text('Paytm'),
                        value: 'Paytm',
                        groupValue: selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            selectedPayment = value as String;
                          });
                        },
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(selectedPayment);
                        },
                        child: Text('Save'),
                      ),
                    ],
                  ),
                );
              },
            ));
      },
    );

    if (selected != null) {
      setState(() {
        selectedPayment = selected;
      });
    }
  }

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
            "Wallet",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        body: ListView(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            alignment: Alignment.topLeft,
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white54,
                )
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Available Balance",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 5.0),
                Flexible(child: Text("2000", style: TextStyle(fontSize: 22)))
              ],
            ),
          ),
          InkWell(
            onTap: _showLanguageModalBottomSheet,
            child: Container(
                height: 70,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const ListTile(
                  title: Text('Message deposited by Admin'),
                  subtitle: Text('2000'),
                  trailing: Icon(Icons.add),
                )),
          )
        ]));
  }
}
