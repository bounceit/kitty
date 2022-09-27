import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/Vector (4).png'),
        ),
        Container(
          height: 32,
          width: 125,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.grey[200]),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/Vector (6).png'),
              ),
              const Text('May, 2021')
            ],
          ),
        ),
        IconButton(
            onPressed: () {}, icon: Image.asset('assets/icons/Vector (5).png'))
      ],
    );
  }
}
