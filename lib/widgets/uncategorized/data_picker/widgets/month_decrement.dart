import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/resources/app_icons.dart';
import 'package:kitty/widgets/uncategorized/data_picker/bloc/main_screen_bloc.dart';

class MonthDec extends StatelessWidget {
  const MonthDec({
    required this.month,
    required this.year,
    Key? key,
  }) : super(key: key);
  final String month;
  final String year;

  void monthDec(
    BuildContext context,
  ) {
    if (month == '1') {
      context.read<MainScreenBloc>().add(
            GetMonthEvent(
              selectedMonth: 12,
              selectedYear: int.parse(year) - 1,
            ),
          );
      return;
    }
    context.read<MainScreenBloc>().add(
          GetMonthEvent(
            selectedMonth: int.parse(month) - 1,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        monthDec(context);
      },
      child: SizedBox(
        width: 30,
        child: SvgPicture.asset(AppIcons.back),
      ),
    );
  }
}
