import 'package:flutter/material.dart';
import 'package:kitty/pages/main_pages/home_page/widgets/transaction_builder.dart';

class ContainerForList extends StatelessWidget {
  const ContainerForList({
    Key? key,
    required this.screenHeight,
    required this.screenWeight,
  }) : super(key: key);

  final double screenHeight;
  final double screenWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 0.3,
        width: screenWeight * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.5, color: Colors.grey.shade300),
        ),
        child: const TransactionBuilder());
  }
}
