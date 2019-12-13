import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final List colors = [
    Colors.pinkAccent,
    Colors.orangeAccent,
    Colors.blueAccent,
    Colors.lightGreenAccent,
    Colors.white,
    Colors.purple,
  ];

  setColor() {
    return colors[4];
  }

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
