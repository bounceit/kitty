part of 'add_transatcion_bloc.dart';

class AddTransatcionEvent extends Equatable {
  const AddTransatcionEvent({
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

  @override
  List<Object> get props => [
        title,
        amount,
        type,
        categoryIcon,
        categoryName,
        color,
      ];
}

enum TransactionType { income, expense }
