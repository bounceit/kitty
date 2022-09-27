import 'package:flutter/material.dart';

class MyTransaction extends StatelessWidget {
  const MyTransaction({
    Key? key,
    required this.transactionName,
    required this.money,
    required this.expenseOrIncome,
    required this.category,
    required this.icon,
  }) : super(key: key);
  final String transactionName;
  final String money;
  final String expenseOrIncome;
  final String category;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
