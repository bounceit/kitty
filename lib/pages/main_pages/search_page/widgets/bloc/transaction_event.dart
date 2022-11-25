part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class InitTransaction extends TransactionEvent {}

class SearchTransaction extends TransactionEvent {
  SearchTransaction({required this.text});
  String text;
}

class FilterTransaction extends TransactionEvent {}
