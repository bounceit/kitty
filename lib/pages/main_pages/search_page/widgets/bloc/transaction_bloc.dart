import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kitty/models/transaction.dart';
import 'package:kitty/repository/transaction_repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(const TransactionState()) {
    on<InitTransaction>((event, emit) async {
      final getAll = await KittyRepository().getAlltranzaction();
      emit(
        state.copyWith(
          transactions: getAll,
        ),
      );
    });
    on<SearchTransaction>((event, emit) async {
      final getAllsearch = await KittyRepository().search(event.text);
      emit(
        state.copyWith(
          transactions: getAllsearch,
        ),
      );
    });
    on<FilterTransaction>((event, emit) {});
  }
}
