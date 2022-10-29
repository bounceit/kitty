import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kitty/models/transaction.dart';
import 'package:kitty/repository/transaction_repository.dart';

part 'add_transatcion_event.dart';
part 'add_transatcion_state.dart';

class AddTransatcionBloc extends Bloc<AddTransatcionEvent, void> {
  AddTransatcionBloc() : super(AddTransatcionInitial()) {
    on<AddTransatcionEvent>((event, emit) {
      switch (event.type) {
        case TransactionType.income:
          final kittys = TransactionModel(
            id: Random().nextInt(999999),
            categoryIcon: event.categoryIcon,
            categoryName: event.categoryName,
            title: event.title,
            amount: event.amount,
            type: 'Income',
          );

          // DataHelper.db.income();
          KittyRepository().addKitty(kittys);
          break;
        case TransactionType.expense:
          final kittys = TransactionModel(
            id: Random().nextInt(999999),
            categoryIcon: event.categoryIcon,
            categoryName: event.categoryName,
            title: event.title,
            amount: event.amount,
            type: 'Expensive',
          );

          // DataHelper.db.expense();
          KittyRepository().addKitty(kittys);
          break;
      }
    });
  }
}
