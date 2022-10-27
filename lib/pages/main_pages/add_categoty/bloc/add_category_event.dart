part of 'add_category_bloc.dart';

class AddCategoryEvent extends Equatable {
  const AddCategoryEvent({required this.category, required this.selectedIcon});

  final String category;
  final String? selectedIcon;
  @override
  List<Object> get props => [];
}
