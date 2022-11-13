part of 'add_transatcion_bloc.dart';

class AddTransatcionEvent extends Equatable {
  const AddTransatcionEvent({
    required this.data,
    required this.categoryName,
    required this.categoryIcon,
    required this.title,
    required this.color,
    required this.amount,
    required this.type,
  });
  final int color;
  final String title;
  final String categoryName;
  final String categoryIcon;
  final int amount;
  final TransactionType type;
  final int data;

  @override
  List<Object> get props => [
        title,
        amount,
        type,
        categoryIcon,
        categoryName,
        color,
        data,
      ];
}

enum TransactionType { income, expense }
