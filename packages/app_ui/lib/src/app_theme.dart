import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
    filledButtonTheme: buttonTheme,
    textTheme: textTheme,
    progressIndicatorTheme: progressIndicatorTheme,
  );

  FilledButtonThemeData get buttonTheme => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: const Color(0xFFDDD5CE),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      minimumSize: const Size(100, 50),
      foregroundColor: colorText,
      textStyle: textTheme.labelMedium,
    ),
  );

  TextTheme get textTheme => TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'SafiraMarch',
      fontSize: 35,
      color: colorText,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'SafiraMarch',
      fontSize: 20,
      color: colorText,
    ),
    labelMedium: TextStyle(
      color: colorText,
      fontWeight: FontWeight.bold,
    ),
  );

  ProgressIndicatorThemeData get progressIndicatorTheme =>
      const ProgressIndicatorThemeData(
        color: Color(0xFFA1301C),
        linearTrackColor: Colors.transparent,
        linearMinHeight: 20,
      );

  final Color colorText = const Color(0xFF554638);
}
