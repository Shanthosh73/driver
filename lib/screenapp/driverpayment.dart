import 'package:flutter/material.dart';

class Driverpayment extends StatefulWidget {
  final Function(String) onSelectPayment;

  Driverpayment(this.onSelectPayment);

  @override
  State<Driverpayment> createState() => _DriverpaymentState();
}

class _DriverpaymentState extends State<Driverpayment> {
  String selectedPayment = '';

  void handlePaymentOption(String paymentOption) {
    setState(() {
      selectedPayment = paymentOption;
    });
    widget.onSelectPayment(paymentOption);
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
      ),
      body: ListView(
        children: [
          CircleAvatar(
            radius: 90,
            child: SizedBox(
              width: 180.0,
              height: 190.0,
              child: Image.asset("assets/onboarding/payment.png"),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ListTile(
              title: Text('Apply Coupon'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 230,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: const BoxDecoration(),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Enter Coupon Code',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1))),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  "Apply",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Add New Card",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  alignment: Alignment.topRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 33,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          PaymentOptionTile(
            'PayPal',
            selectedPayment,
            handlePaymentOption,
            'assets/onboarding/paypal.jpg',
          ),
          PaymentOptionTile(
            'Cash',
            selectedPayment,
            handlePaymentOption,
            'assets/onboarding/visa.jpg',
          ),
          PaymentOptionTile(
            'Card',
            selectedPayment,
            handlePaymentOption,
            'assets/onboarding/visa.jpg',
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      "\$ 250",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  margin: const EdgeInsets.only(left: 50),
                  alignment: Alignment.center,
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Text(
                    "Book Ride",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PaymentOptionTile extends StatelessWidget {
  final String paymentOption;
  final String selectedPayment;
  final Function(String) onSelectPayment;
  final String iconAsset;

  PaymentOptionTile(
    this.paymentOption,
    this.selectedPayment,
    this.onSelectPayment,
    this.iconAsset,
  );

  @override
  Widget build(BuildContext context) {
    final isSelected = paymentOption == selectedPayment;

    return ListTile(
      title: Text(paymentOption),
      leading: Image.asset(
        iconAsset,
        width: 32,
        height: 32,
      ),
      tileColor: isSelected ? Colors.blue : Colors.transparent,
      onTap: () {
        onSelectPayment(paymentOption);
      },
    );
  }
}
