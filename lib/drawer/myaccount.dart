import 'dart:io';

import 'package:driver/drawer/bankaccount.dart';
import 'package:driver/drawer/addbankaccount.dart';
import 'package:driver/drawer/edit.dart';
import 'package:driver/drawer/history.dart';
import 'package:driver/drawer/wallet.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myaccount extends StatefulWidget {
  final Map<String, dynamic> data;

  Myaccount({required this.data});
  @override
  State<Myaccount> createState() => _MyaccountState();
}

class _MyaccountState extends State<Myaccount> {
  String? _selectedImage;
  String? _name;
  String? _email;
  String? _phone;
  List<BankAccount> _bankAccounts = [];
  @override
  void initState() {
    super.initState();
    _loadData();
    loadBankAccounts();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImagePath = prefs.getString('avatar_image');
    final savedName = prefs.getString('name');
    final savedEmail = prefs.getString('email');
    final savedPhone = prefs.getString('phone');

    setState(() {
      _selectedImage = savedImagePath;
      _name = savedName;
      _email = savedEmail;
      _phone = savedPhone;
    });
  }

  Future<void> loadBankAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final savedAccounts = prefs.getStringList('bank_accounts');

    if (savedAccounts != null) {
      setState(() {
        _bankAccounts = savedAccounts
            .map((jsonString) => BankAccount.fromJson(jsonString))
            .toList();
      });
    }
  }

  void _addBankAccount(BankAccount bankAccount) async {
    _bankAccounts.add(bankAccount);
    _saveBankAccounts();

    setState(() {
      _bankAccounts = _bankAccounts;
    });
  }

  void _navigateToAddBankAccountScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddBankAccountScreen(_addBankAccount),
      ),
    );
  }

  void _deleteBankAccount(BankAccount account) async {
    _bankAccounts.remove(account);

    _saveBankAccounts();

    setState(() {
      _bankAccounts = _bankAccounts;
    });
  }

  Future<void> _saveBankAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final accountsJson =
        _bankAccounts.map((account) => account.toJson()).toList();
    await prefs.setStringList('bank_accounts', accountsJson);
  }

  String selectedLanguage = "English"; // Default language

  void _showLanguageModalBottomSheet() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Choose Language',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  RadioListTile(
                    title: Text('English'),
                    value: 'English',
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage =
                            value as String; // Cast value to String
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Spanish'),
                    value: 'Spanish',
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value as String;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(selectedLanguage);
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedLanguage = selected;
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
            "My Account",
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
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.white),
                  ]),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: _selectedImage != null
                      ? FileImage(File(_selectedImage!))
                      : null,
                ),
                title: Text(_name ?? 'Name not available'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_email ?? 'Email not available'),
                    Text(_phone ?? 'Phone not available'),
                  ],
                ),
                trailing: Container(
                  width: 26,
                  height: 26,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'ADD BANK ACCOUNTS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              alignment: Alignment.topLeft,
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.white),
                ],
              ),
              child: Column(
                children: [
                  ..._bankAccounts.map((account) {
                    return BankAccountCard(
                      bankAccount: account,
                      deleteBankAccount: _deleteBankAccount,
                    );
                  }),
                  if (_bankAccounts.length < 2)
                    Center(
                        child: Container(
                      child: ListTile(
                        leading: Icon(Icons.add_box),
                        title: Text('ADD BANK ACCOUNT',
                            style: TextStyle(fontSize: 15)),
                        onTap: () {
                          _navigateToAddBankAccountScreen(context);
                        },
                      ),
                    )),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                alignment: Alignment.topLeft,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("QUICK LINKS",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                )),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const History()));
              },
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const ListTile(
                    leading: Icon(Icons.history),
                    title: Text('History'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )),
            ),
            InkWell(
              onTap: _showLanguageModalBottomSheet,
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const ListTile(
                    leading: Icon(Icons.language_sharp),
                    title: Text('Choose language'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Wallet()));
              },
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const ListTile(
                    leading: Icon(Icons.wallet),
                    title: Text('Wallet'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )),
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                alignment: Alignment.center,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Delete Account",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(60)),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )),
          ],
        ));
  }
}

class BankAccountCard extends StatelessWidget {
  final BankAccount bankAccount;
  final Function(BankAccount) deleteBankAccount;

  BankAccountCard({
    required this.bankAccount,
    required this.deleteBankAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: .0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.account_balance_rounded),
            title: Text(
              '${bankAccount.bankName} - ${bankAccount.cardNumber.substring(bankAccount.cardNumber.length - 4)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    deleteBankAccount(bankAccount);
                  },
                  child: Text(
                    'DELETE',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                )
              ],
            ),
          ),
          // You can add more details here as needed
        ],
      ),
    );
  }
}
