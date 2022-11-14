import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/models/category_model.dart';
import 'package:kitty/repository/transaction_repository.dart';
import 'package:kitty/resources/app_colors.dart';
import 'package:kitty/services.dart/database.dart';

class TextBox extends StatelessWidget {
  const TextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              fillColor: AppColors.appBarAddPage),
          onChanged: (String text) async {
            var res = await KittyRepository().search(text);

            print(res);
          }),
    );
  }
}
