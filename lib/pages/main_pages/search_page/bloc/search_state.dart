part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  const SearchLoaded({required this.transactionModel});
  final List<CategoryModel> transactionModel;
}

class SearchError extends SearchState {
  const SearchError(this.message);
  final String? message;
}
