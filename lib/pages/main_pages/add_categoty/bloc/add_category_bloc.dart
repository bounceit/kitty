import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kitty/models/category_model.dart';
import 'package:kitty/repository/transaction_repository.dart';

part 'add_category_event.dart';
part 'add_category_state.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent, AddCategoryState> {
  AddCategoryBloc() : super(AddCategoryInitial()) {
    on<AddCategoryEvent>((event, emit) {
      final category =
          CategoryModel(category: event.category, icon: event.selectedIcon!);
      KittyRepository().addCategoryy(category);
    });
  }
}