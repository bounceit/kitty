import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/resources/app_colors.dart';
import 'package:kitty/resources/app_icons.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DataWidget> createState() => DataWidgetState();
}

class DataWidgetState extends State<DataWidget> {
  @override
  void initState() {
    super.initState();
    selectedData;
  }

  static var selectedData = 'Today';
  final List<String> _mounths = [
    'Jan',
    'Feb',
    'May',
    'Apr',
    'May',
    'June',
    'Jule',
    'Avg',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            selectedData == _mounths.first;
          },
          icon: SvgPicture.asset(AppIcons.back),
        ),
        Container(
          height: 32,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey[200],
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  showGeneralDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: '',
                      transitionDuration: const Duration(
                        milliseconds: 200,
                      ),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            30,
                            120,
                            30,
                            MediaQuery.of(context).size.height * 0.5,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: AppColors.appBarAddPage,
                                border: Border.all(color: Colors.grey.shade100),
                                borderRadius: BorderRadius.circular(20)),
                            height: 330,
                            width: 250,
                            // color: AppColors.appBarAddPage,
                            child: GridView.builder(
                                itemCount: _mounths.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisExtent: 60,
                                ),
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade500),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 5, 12, 5)),
                                        onPressed: () {
                                          setState(() {
                                            selectedData = _mounths[index];
                                          });
                                        },
                                        child: Text(_mounths[index],
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                decoration:
                                                    TextDecoration.none)),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        );
                      });
                },
                icon: SvgPicture.asset(AppIcons.calendar),
              ),
              Text('$selectedData 2022'),
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                selectedData = _mounths.last;
              });
            },
            icon: SvgPicture.asset(AppIcons.go))
      ],
    );
  }
}
