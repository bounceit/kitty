import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty/pages/main_pages/search_page/widgets/bloc/transaction_bloc.dart';
import 'package:kitty/resources/app_colors.dart';

class TextBox extends StatelessWidget {
  const TextBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            fillColor: AppColors.appBarAddPage),
        onChanged: (text) async {
          context.read<TransactionBloc>().add(
                SearchTransaction(text: text),
              );
        },
        onSubmitted: (text) {
          context.read<TransactionBloc>().add(
                SearchTransaction(text: text),
              );
        },
      ),
    );
  }
}
