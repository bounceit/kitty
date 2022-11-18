import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/models/category_model.dart';
import 'package:kitty/models/transaction.dart';
import 'package:kitty/repository/transaction_repository.dart';
import 'package:kitty/resources/app_icons.dart';

class ListSearchCategory extends StatefulWidget {
  ListSearchCategory({
    required this.isSelected,
    required this.categorys,
    Key? key,
  }) : super(key: key);
  ValueChanged<bool> isSelected;
  List<CategoryModel> categorys;

  @override
  State<ListSearchCategory> createState() => _ListSearchCategoryState();
}

class _ListSearchCategoryState extends State<ListSearchCategory> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categorys.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Card(
                elevation: 0.0,
                borderOnForeground: false,
                // color: Colors.transparent,
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? Colors.blue
                          : Color(widget.categorys[index].color),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: TextButton(
                    child: Row(
                      children: [
                        isSelected
                            ? SvgPicture.asset(
                                AppIcons.done,
                              )
                            : SvgPicture.asset(
                                widget.categorys[index].icon,
                              ),
                        Spacer(),
                        Text(
                          widget.categorys[index].category,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                        widget.isSelected(isSelected);
                      });
                    },
                  ),
                ),
              ),
            ],
          );
        });
  }
}
