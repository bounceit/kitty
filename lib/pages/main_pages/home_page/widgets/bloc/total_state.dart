part of 'total_bloc.dart';

abstract class TotalState extends Equatable {
  const TotalState();

  @override
  List<Object> get props => [];
}

class TotalInitial extends TotalState {}

class TotalLoading extends TotalState {}

class TotalLoaded extends TotalState {
  const TotalLoaded({required this.summuryModel, required this.summaryExp});
  final SummaryModel summuryModel;
  final SummaryModel summaryExp;
}

class TotalError extends TotalState {
  const TotalError(this.message);
  final String? message;
}
