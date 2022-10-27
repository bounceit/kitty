import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CategoryChoise extends StatefulWidget {
  const CategoryChoise({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryChoise> createState() => _CategoryChoiseState();
}

class _CategoryChoiseState extends State<CategoryChoise> {
  static PanelController pc = PanelController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextField(
          onTap: () => pc.open(),
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            labelText: 'Category name',
            // helperText: 'Category name',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            hintStyle: TextStyle(color: Colors.grey[800]),
          ),
        ),
      ],
    );
  }
}
