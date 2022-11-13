part of 'total_bloc.dart';

abstract class TotalEvent extends Equatable {
  const TotalEvent();

  @override
  List<Object> get props => [];
}

class GetTotalList extends TotalEvent {}
