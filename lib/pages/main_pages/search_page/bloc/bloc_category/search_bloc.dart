import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kitty/models/category_model.dart';
import 'package:kitty/models/transaction.dart';
import 'package:kitty/repository/transaction_repository.dart';

import '../../widgets/text_box.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    final KittyRepository kittyRep = KittyRepository();

    on<SearchEvent>((event, emit) async {
      try {
        emit(SearchLoading());
        final mList = await kittyRep.getAllCategory();

        emit(SearchLoaded(
          transactionModel: mList,
        ));
      } on NetworkError {
        emit(SearchError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
