import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/models/category_model.dart';

import 'package:kitty/models/transaction.dart';
import 'package:kitty/pages/main_pages/add_categoty/add_categoty.dart';
import 'package:kitty/pages/main_pages/add_new_page/bloc/add_transatcion_bloc.dart';
import 'package:kitty/pages/main_pages/home_page/home_page.dart';
import 'package:kitty/repository/transaction_repository.dart';
import 'package:kitty/resources/app_colors.dart';
import 'package:kitty/resources/app_icons.dart';
import 'package:kitty/services.dart/database.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddNew extends StatefulWidget {
  AddNew({Key? key}) : super(key: key);
  static const routeName = '/add_new';

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  void _onPressed() {
    final title = discriptionController.text;
    final amount = int.parse(amountController.text);
    final TransactionType type;
    if (dropdownvalue == 'Income') {
      type = TransactionType.income;
    } else {
      type = TransactionType.expense;
    }
    context.read<AddTransatcionBloc>().add(AddTransatcionEvent(
          title: title,
          amount: amount,
          type: type,
        ));
  }

  var items = [
    'Expensive',
    'Income',
  ];
  String dropdownvalue = 'Income';
  TextEditingController discriptionController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PanelController pc = PanelController();
    return BlocProvider(
      create: (context) => AddTransatcionBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.grey[800],
          ),
          title: Text('Add New',
              style: TextStyle(
                color: Colors.grey[800],
              )),
          backgroundColor: AppColors.appBarAddPage,
        ),
        body: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Select type',
                      // helperText: 'Select type',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                    ),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                        if (newValue == 'Expensive') {
                          setState(() {});
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () => pc.open(),
                    child: TextField(
                      onTap: () => pc.open(),
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      decoration: InputDecoration(
                        labelText: 'Category name',
                        helperText: 'Category name',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      helperText: 'Amount',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    controller: discriptionController,
                    decoration: InputDecoration(
                      labelText: 'Discription (Optional)',
                      // helperText: 'category name',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          onPressed: () {
                            _onPressed();
                            Navigator.pushNamedAndRemoveUntil(
                                context, HomePage.routeName, (route) => false);
                          },
                          child: const Text('Save')))
                ]),
                SlidingUpPanel(
                  color: AppColors.appBarAddPage,
                  borderRadius: BorderRadius.circular(20),
                  minHeight: 0.0,
                  maxHeight: MediaQuery.of(context).size.height * 0.25,
                  defaultPanelState: PanelState.CLOSED,
                  controller: pc,
                  panel: Column(
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
                        'choose categoty'.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 200,
                        child: FutureBuilder(
                            future: KittyRepository().getAllCategory(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final List<CategoryModel> categorys =
                                  snapshot.data as List<CategoryModel>;
                              print(categorys);

                              return GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 35,
                                    crossAxisSpacing: 65,
                                    childAspectRatio: 1.0,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        SvgPicture.asset(categorys[index].icon),
                                        Text(categorys[index].category),
                                      ],
                                    );
                                  });
                            }),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AddCategoryPage.routeName,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Add new category',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            // body: Container(
            //   height: 8,
            //   decoration: BoxDecoration(
            //       color: Colors.grey[500],
            //       borderRadius: const BorderRadius.only(
            //         topLeft: Radius.circular(5),
            //         topRight: Radius.circular(5),
            //       )),
            // ),
            // border: Border(top: BorderSide()),
          );
        }),
      ),
    );
  }
}
