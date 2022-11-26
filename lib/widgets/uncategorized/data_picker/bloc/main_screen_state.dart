part of 'main_screen_bloc.dart';

class MainScreenState {
  MainScreenState({
    required this.selectedMonth,
    required this.selectedYear,
  });

  String selectedMonth;
  final String selectedYear;

  MainScreenState copyWith({
    String? selectedMonth,
    String? selectedYear,
  }) {
    return MainScreenState(
      selectedMonth: selectedMonth ?? this.selectedMonth,
      selectedYear: selectedYear ?? this.selectedYear,
    );
  }

  final List<String> months = const [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
}
