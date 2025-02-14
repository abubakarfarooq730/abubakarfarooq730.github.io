import 'package:flutter/material.dart';

class CustomerStatement {
  final String date;
  final double total;
  final double invoiceDue;
  final double receiving;
  final double balance;

  CustomerStatement({
    required this.date,
    required this.total,
    required this.invoiceDue,
    required this.receiving,
    required this.balance,
  });

  factory CustomerStatement.fromJson(Map<String, dynamic> json) {
    return CustomerStatement(
      date: json['date'] as String,
      total: json['total'] as double,
      invoiceDue: json['invoiceDue'] as double,
      receiving: json['receiving'] as double,
      balance: json['balance'] as double,
    );
  }
}
