import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/pages/main_pages/manage_category/manage_category.dart';
import 'package:kitty/resources/app_colors.dart';
import 'package:kitty/resources/app_icons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const routeName = '/settings_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: AppColors.appBarAddPage,
        elevation: 0.0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.22,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Card(
          elevation: 0.0,
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                ManageCategory.routeName,
              );
            },
            trailing: SvgPicture.asset(AppIcons.go),
            leading: SvgPicture.asset(AppIcons.categories),
            title: const Text(
              'Manage Categories',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Card(
          elevation: 0.0,
          child: ListTile(
            trailing: SvgPicture.asset(AppIcons.go),
            leading: SvgPicture.asset(AppIcons.pdf),
            title: const Text(
              'Export to PDF',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Card(
          elevation: 0.0,
          child: ListTile(
            trailing: SvgPicture.asset(AppIcons.go),
            leading: SvgPicture.asset(AppIcons.translate),
            title: const Text(
              'Choose Language',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Card(
          elevation: 0.0,
          child: ListTile(
            trailing: SvgPicture.asset(AppIcons.go),
            leading: SvgPicture.asset(AppIcons.quetions),
            title: const Text(
              'Frequently asked questions',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Card(
          elevation: 0.0,
          child: ListTile(
            trailing: SvgPicture.asset(AppIcons.go),
            leading: SvgPicture.asset(AppIcons.logout),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
