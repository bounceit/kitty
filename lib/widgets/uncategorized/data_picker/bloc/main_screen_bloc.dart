import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc()
      : super(MainScreenState(
          selectedMonth: DateTime.now().month.toString(),
          selectedYear: DateTime.now().year.toString(),
        )) {
    on<GetMonthEvent>(
      (event, emit) async {
        final String selectedMonth =
            event.selectedMonth?.toString() ?? state.selectedMonth;
        print(selectedMonth);
        final String selectedYear =
            event.selectedYear?.toString() ?? state.selectedYear;

        emit(
          state.copyWith(
            selectedMonth: selectedMonth,
            selectedYear: selectedYear,
          ),
        );
      },
    );
  }
}
