import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/models/category_model.dart';
import 'package:kitty/repository/transaction_repository.dart';

class ListSearchCategory extends StatelessWidget {
  const ListSearchCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            return Container(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categorys.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            color: Color(categorys[index].color),
                          ),
                          alignment: AlignmentDirectional.center,
                          child: TextButton(
                            child: SvgPicture.asset(
                              categorys[index].icon,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Text(categorys[index].category)
                      ],
                    );
                  }),
            );
          }
        });
  }
}
