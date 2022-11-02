part of 'add_category_bloc.dart';

class AddCategoryEvent extends Equatable {
  const AddCategoryEvent(
      {required this.category,
      required this.selectedIcon,
      required this.selectedColor});

  final String category;
  final String? selectedIcon;
  final int? selectedColor;
  @override
  List<Object> get props => [];
}
