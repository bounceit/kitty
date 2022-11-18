import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty/pages/main_pages/search_page/bloc/search_bloc.dart';
import 'package:kitty/pages/main_pages/search_page/widgets/list_search_category.dart';
import 'package:kitty/pages/main_pages/search_page/widgets/text_box.dart';
import 'package:kitty/resources/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = '/search_page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool typing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 50,
        iconTheme: IconThemeData(color: Colors.grey.shade400),
        backgroundColor: Colors.white,
        title: const TextBox(),
      ),
      body: BlocProvider(
        create: (context) => SearchBloc()
          ..add(
            GetSearchList(),
          ),
        child: BlocListener<SearchBloc, SearchState>(
          listener: (context, state) {
            if (state is SearchError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchInitial) {
                return const CircularProgressIndicator();
              } else if (state is SearchLoading) {
                return const CircularProgressIndicator();
              } else if (state is SearchLoaded) {
                return Column(
                  children: [
                    Expanded(
                      child: ListSearchCategory(
                        categorys: state.transactionModel,
                        isSelected: (bool value) {},
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(),
                    )
                  ],
                );
              } else if (state is SearchError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
