import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/resources/app_icons.dart';

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
          icon: SvgPicture.asset(AppIcons.back),
        ),
        Container(
          height: 32,
          width: 125,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.grey[200]),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  AlertDialog(
                    title: Text('DataPicker'),
                    actions: [TextButton(onPressed: () {}, child: Text('ok'))],
                    content: Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                      child: Text('1111'),
                    ),
                  );
                },
                icon: SvgPicture.asset(AppIcons.calendar),
              ),
              const Text('May, 2021')
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: SvgPicture.asset(AppIcons.go))
      ],
    );
  }
}
