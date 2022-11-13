import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = '/search_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey.shade500),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [TextField()],
      ),
      body: Center(
        child: Text('SearchPage'),
      ),
    );
  }
}
