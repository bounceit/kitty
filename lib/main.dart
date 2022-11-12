import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kitty/pages/splash_page/splash_page.dart';
import 'package:kitty/resources/app_theme.dart';
import 'package:kitty/routes/routes.dart';
import 'package:month_year_picker/month_year_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      theme: AppThemes.light(),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
