import 'dart:convert';

import 'package:flutter/material.dart';

class BankAccount {
  final String bankName;
  final String cardNumber;
  final String accountHolderName;
  final int expiryMonth;
  final int expiryYear;

  BankAccount({
    required this.bankName,
    required this.cardNumber,
    required this.accountHolderName,
    required this.expiryMonth,
    required this.expiryYear,
  });

  String toJson() {
    return '{"bankName": "$bankName", "cardNumber": "$cardNumber", "accountHolderName": "$accountHolderName", "expiryMonth": $expiryMonth, "expiryYear": $expiryYear, }';
  }

  factory BankAccount.fromJson(String json) {
    final Map<String, dynamic> data = jsonDecode(json);
    return BankAccount(
      bankName: data['bankName'],
      cardNumber: data['cardNumber'],
      accountHolderName: data['accountHolderName'],
      expiryMonth: data['expiryMonth'],
      expiryYear: data['expiryYear'],
    );
  }
}
