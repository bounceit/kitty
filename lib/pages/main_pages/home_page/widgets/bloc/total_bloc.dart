import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kitty/models/summary_model.dart';
import 'package:kitty/repository/transaction_repository.dart';

part 'total_event.dart';
part 'total_state.dart';

class TotalBloc extends Bloc<TotalEvent, TotalState> {
  TotalBloc() : super(TotalInitial()) {
    final KittyRepository kittyRep = KittyRepository();

    on<GetTotalList>((event, emit) async {
      try {
        emit(TotalLoading());
        final mList = await kittyRep.totalIncome();
        final eList = await kittyRep.totalExpense();

        emit(TotalLoaded(
          summuryModel: mList.first,
          summaryExp: eList.first,
        ));
      } on NetworkError {
        emit(const TotalError('Failed to fetch data. is your device online?'));
      }
    });
  }
}
