import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/models/category_model.dart';
import 'package:kitty/repository/transaction_repository.dart';
import 'package:kitty/resources/app_colors.dart';
import 'package:kitty/resources/app_icons.dart';

class ManageCategory extends StatefulWidget {
  const ManageCategory({Key? key}) : super(key: key);
  static const routeName = '/manage_category';

  @override
  State<ManageCategory> createState() => _ManageCategoryState();
}

class _ManageCategoryState extends State<ManageCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColors.appBarAddPage,
        elevation: 0.0,
        title: const Text(
          'Manage Category',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder(
        future: KittyRepository().getAllCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<CategoryModel> categorys =
              snapshot.data as List<CategoryModel>;
          if (categorys.isEmpty) {
            return const Text('Добавьте категорию');
          } else {
            return ReorderableListView.builder(
              itemCount: categorys.length,
              itemBuilder: (context, index) {
                return Card(
                  key: Key('$index'),
                  child: ListTile(
                    // dense: true,
                    leading: SvgPicture.asset(categorys[index].icon),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(categorys[index].category),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Edit'),
                        ),
                      ],
                    ),
                    trailing: SvgPicture.asset(AppIcons.dragCat),
                  ),
                );
              },
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final CategoryModel item = categorys.removeAt(oldIndex);
                  categorys.insert(newIndex, item);
                });
              },
            );
          }
        },
      ),
    );
  }
}
