import 'package:flutter/material.dart';
import 'package:kitty/pages/main_of_main.dart';
import 'package:kitty/pages/main_pages/home_page/home_page.dart';
import 'package:kitty/pages/main_pages/report_page/report_page.dart';
import 'package:kitty/pages/main_pages/settings_page/settings_page.dart';
import 'package:kitty/pages/splash_page/splash_page.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? arguments = settings.arguments;
    WidgetBuilder builder;

    switch (settings.name) {
      case HomePage.routeName:
        builder = (_) => const HomePage();
        break;

      case MainPage.routeName:
        builder = (_) => const MainPage();
        break;

      case ReportPage.routeName:
        builder = (_) => const ReportPage();
        break;

      case SettingsPage.routeName:
        builder = (_) => const SettingsPage();
        break;

      case SplashScreen.routeName:
        builder = (_) => const SplashScreen();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
