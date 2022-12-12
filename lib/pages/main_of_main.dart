import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty/blocs/bloc_navigations/navigation_bloc.dart';
import 'package:kitty/pages/main_pages/home_page/home_page.dart';
import 'package:kitty/pages/main_pages/home_page/widgets/bloc/total_bloc.dart';
import 'package:kitty/pages/main_pages/report_page/report_page.dart';
import 'package:kitty/pages/main_pages/search_page/widgets/bloc/transaction_bloc.dart';
import 'package:kitty/pages/main_pages/settings_page/settings_page.dart';
import 'package:kitty/widgets/uncategorized/data_picker/bloc/main_screen_bloc.dart';

import '../blocs/bloc_navigations/navigation_event.dart';
import '../blocs/bloc_navigations/navigation_state.dart';
import '../routes/routes.dart';
import '../widgets/navigation/bottom_nav_bar.dart';
import 'main_pages/settings_page/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const List<String> _pages = [
    ReportPage.routeName,
    HomePage.routeName,
    SettingsPage.routeName,
  ];

  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  void _onSelectMenu(String route) {
    if (_navigatorKey.currentState != null) {
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        route,
        (_) => false,
      );
    }
  }

  void _onSelectTab(String route) {
    if (_navigatorKey.currentState != null) {
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        route,
        (route) => false,
      );
    }
  }

  Future<bool> _onWillPop() async {
    final bool maybePop = await _navigatorKey.currentState!.maybePop();

    return !maybePop;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (_, state) {
        if (state.status == NavigationStateStatus.menu) {
          _onSelectMenu(state.route);
        }

        if (state.status == NavigationStateStatus.tab) {
          _onSelectTab(state.route);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            body: Navigator(
              key: _navigatorKey,
              initialRoute: HomePage.routeName,
              onGenerateRoute: AppRouter.generateRoute,
            ),
            bottomNavigationBar: BottomNavBar(
              currentTab: state.currentIndex,
              onSelect: (int index) {
                if (state.currentIndex != index) {
                  context.read<NavigationBloc>().add(
                        NavigateTab(
                          tabIndex: index,
                          route: _pages[index],
                        ),
                      );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
