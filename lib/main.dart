import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kitty/blocs/bloc_navigations/navigation_bloc.dart';
import 'package:kitty/pages/splash_page/splash_page.dart';
import 'package:kitty/resources/app_theme.dart';
import 'package:kitty/routes/routes.dart';
import 'package:kitty/widgets/uncategorized/data_picker/bloc/main_screen_bloc.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'pages/main_pages/home_page/widgets/bloc/total_bloc.dart';
import 'pages/main_pages/search_page/widgets/bloc/transaction_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenBloc>(
          create: (_) => MainScreenBloc()
            ..add(GetMonthEvent())
            ..add(GetTapMounthEvent()),
        ),
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(),
        ),
        BlocProvider<TransactionBloc>(
          create: (_) => TransactionBloc(),
        ),
        BlocProvider<TotalBloc>(
          create: (_) => TotalBloc(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          MonthYearPickerLocalizations.delegate,
        ],
        theme: AppThemes.light(),
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
