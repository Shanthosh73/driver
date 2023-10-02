import 'package:driver/drawer/bankaccount.dart';
import 'package:flutter/material.dart';

class AddBankAccountScreen extends StatefulWidget {
  final Function(BankAccount) addBankAccount;

  AddBankAccountScreen(this.addBankAccount);

  @override
  State<AddBankAccountScreen> createState() => _AddBankAccountScreenState();
}

class _AddBankAccountScreenState extends State<AddBankAccountScreen> {
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _accountHolderNameController =
      TextEditingController();
  final TextEditingController _expiryMonthController = TextEditingController();
  final TextEditingController _expiryYearController = TextEditingController();

  void _saveBankAccount() {
    final bankAccount = BankAccount(
      bankName: _bankNameController.text,
      cardNumber: _cardNumberController.text,
      accountHolderName: _accountHolderNameController.text,
      expiryMonth: int.parse(_expiryMonthController.text),
      expiryYear: int.parse(_expiryYearController.text),
    );

    widget.addBankAccount(bankAccount);

    Navigator.pop(context);
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
            "Add Bank Account",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(),
              child: TextFormField(
                controller: _accountHolderNameController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Enter Account Holder Name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black, width: 2))),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(),
              child: TextFormField(
                controller: _bankNameController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.account_balance_rounded),
                    hintText: 'Enter your Bank Name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black, width: 2))),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(),
              child: TextFormField(
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.credit_card_sharp),
                    hintText: 'Enter your Card number',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black, width: 2))),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(),
              child: TextFormField(
                controller: _expiryMonthController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.credit_card_sharp),
                    hintText: 'Expiry Month',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black, width: 2))),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(),
              child: TextFormField(
                controller: _expiryYearController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.credit_card_sharp),
                    hintText: 'Expiry Year',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black, width: 2))),
              ),
            ),
            InkWell(
              onTap: _saveBankAccount,
              child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(60)),
                  child: const Text(
                    "Save Card",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  )),
            ),
          ],
        ));
  }
}
