part of 'add_transatcion_bloc.dart';

class AddTransatcionEvent extends Equatable {
  const AddTransatcionEvent({
    required this.title,
    required this.amount,
    required this.type,
  });
  final String title;
  final int amount;
  final TransactionType type;

  @override
  List<Object> get props => [title, amount, type];
}

enum TransactionType { income, expense }
