part of 'transaction_bloc.dart';

class TransactionState extends Equatable {
  const TransactionState({
    this.selected = const [],
    this.transactions = const [],
  });
  final List<TransactionModel> transactions;
  final List<int> selected;
  @override
  List<Object> get props => [];
  TransactionState copyWith({
    List<TransactionModel>? transactions,
    List<int>? selected,
  }) {
    return TransactionState(
      selected: selected ?? this.selected,
      transactions: transactions ?? this.transactions,
    );
  }
}
