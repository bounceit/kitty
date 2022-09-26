import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitty/pages/splash_page/splash_page.dart';
import 'package:kitty/routes/routes.dart';

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
    return const MaterialApp(
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
