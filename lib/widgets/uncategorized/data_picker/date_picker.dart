import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/resources/app_colors.dart';
import 'package:kitty/resources/app_icons.dart';
import 'package:kitty/widgets/uncategorized/data_picker/bloc/main_screen_bloc.dart';
import 'package:kitty/widgets/uncategorized/data_picker/widgets/month_decrement.dart';
import 'package:kitty/widgets/uncategorized/data_picker/widgets/month_increment.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MonthDec(
              month: state.selectedMonth,
              year: state.selectedYear,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showGeneralDialogs(context, state);
                    },
                    icon: SvgPicture.asset(
                      AppIcons.calendar,
                      // color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    state.months.elementAt(int.parse(state.selectedMonth) - 1),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    state.selectedYear,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // ),
            MonthInc(
              month: state.selectedMonth,
              year: state.selectedYear,
            ),
          ],
        );
      },
    );
  }

  Future<Object?> showGeneralDialogs(
      BuildContext context, MainScreenState state) {
    return showGeneralDialog(
        barrierColor: Colors.transparent,
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(
          milliseconds: 200,
        ),
        pageBuilder: (BuildContext context, Animation<double> animation,
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
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: AppColors.appBarAddPage,
                border: Border.all(color: Colors.grey.shade100),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 330,
              width: 250,
              // color: AppColors.appBarAddPage,
              child: GridView.builder(
                  itemCount: state.months.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 60,
                  ),
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade500),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                          ),
                          onPressed: () {
                            context.read<MainScreenBloc>().add(
                                  GetMonthEvent(
                                    selectedMonth:
                                        int.parse(state.selectedMonth) + 4,
                                  ),
                                );
                          },
                          child: Text(
                            state.months[index],
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        });
  }
}
