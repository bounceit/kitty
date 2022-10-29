import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/pages/main_pages/add_categoty/bloc/add_category_bloc.dart';
import 'package:kitty/pages/main_pages/home_page/home_page.dart';
import 'package:kitty/resources/app_colors.dart';
import 'package:kitty/resources/app_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({Key? key}) : super(key: key);
  static const routeName = '/add_category_page';

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  TextEditingController categoryName = TextEditingController();

  PanelController pc = PanelController();
  final List<String> icons = [
    AppIcons.ball,
    AppIcons.car,
    AppIcons.city,
    AppIcons.coffee,
    AppIcons.computer,
    AppIcons.education,
    AppIcons.food,
    AppIcons.fuel,
    AppIcons.gratulation,
    AppIcons.hand,
    AppIcons.happy,
    AppIcons.health,
    AppIcons.human,
    AppIcons.liquor,
    AppIcons.money,
    AppIcons.pig,
    AppIcons.shop,
  ];
  String defalutIcon = AppIcons.cafe;
  String? selectedIcon;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.grey[800],
          ),
          title: Text(
            'Add new category',
            style: TextStyle(color: Colors.grey[800]),
          ),
          backgroundColor: AppColors.appBarAddPage,
        ),
        body: Builder(builder: (context) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              pc.open();
                            },
                            icon:
                                SvgPicture.asset(selectedIcon ?? defalutIcon)),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: TextField(
                            controller: categoryName,
                            decoration: InputDecoration(
                              labelText: 'Category name',
                              // helperText: 'category name',
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              hintStyle: TextStyle(color: Colors.grey[800]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          context.read<AddCategoryBloc>().add(AddCategoryEvent(
                              category: categoryName.text,
                              selectedIcon: selectedIcon));
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomePage.routeName, (route) => false);
                        },
                        child: const Text('Add new category'))
                  ],
                ),
              ),
              SlidingUpPanel(
                color: AppColors.appBarAddPage,
                borderRadius: BorderRadius.circular(20),
                minHeight: 0.0,
                maxHeight: MediaQuery.of(context).size.height * 0.5,
                defaultPanelState: PanelState.CLOSED,
                controller: pc,
                panel: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 5, 30, 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      SvgPicture.asset(AppIcons.drag),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'choose categoty Icon'.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      // GridView.count(
                      //   crossAxisCount: 4,
                      //   children: List.generate(
                      //     icons.length,
                      //     (index) {
                      //       return Center(
                      //         child: icons[index],
                      //       );
                      //     },
                      //   ),
                      // )
                      SizedBox(height: 20),
                      Expanded(
                        child: CustomScrollView(
                            // controller: scroll,
                            clipBehavior: Clip.hardEdge,
                            slivers: [
                              SliverGrid(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 35,
                                  crossAxisSpacing: 65,
                                  childAspectRatio: 1.0,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(150),
                                        color: selectedIcon == icons[index]
                                            ? Colors.blue
                                            : Colors.amber[200],
                                      ),
                                      alignment: AlignmentDirectional.center,
                                      child: TextButton(
                                        child: SvgPicture.asset(icons[index]),
                                        onPressed: () {
                                          setState(() {
                                            selectedIcon = icons[index];
                                            // print(selectedIcon);
                                          });
                                        },
                                      ),
                                    );
                                  },
                                  childCount: icons.length,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
