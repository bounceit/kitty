import 'package:flutter/material.dart';
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
      appBar: AppBar(
        toolbarHeight: 250,
        iconTheme: IconThemeData(color: Colors.grey.shade400),
        backgroundColor: Colors.white,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Expanded(flex: 1, child: TextBox()),
            Expanded(child: ListSearchCategory())
          ],
        ),
      ),
      body: const Center(
        child: const Text('Your app content'),
      ),
    );
  }
}
