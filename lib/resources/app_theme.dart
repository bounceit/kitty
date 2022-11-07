import 'package:flutter/material.dart';
import 'package:kitty/resources/app_fonts.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light() {
    //! Тут можно указать один шрифт на все страницы
    return ThemeData(
      fontFamily: AppFonts.fontFamily,
    );
  }
}
