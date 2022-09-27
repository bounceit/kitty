import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key, this.size}) : super(key: key);
  final int? size;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(50.0),
            ),
            border: Border.all(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 5.0,
          ),
          width: screenWidth * 0.75,
          height: 30.0,
          child: Row(
            children: const [
              LinearProgressIndicator(
                value: (500),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.blue,
                ),
                backgroundColor: Colors.white,
              ),
              LinearProgressIndicator(
                value: (400),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.red,
                ),
                backgroundColor: Colors.white,
              ),
              LinearProgressIndicator(
                value: (300),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.amber,
                ),
                backgroundColor: Colors.white,
              ),
              LinearProgressIndicator(
                value: (100),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green,
                ),
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
