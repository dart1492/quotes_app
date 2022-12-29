import 'package:flutter/material.dart';

import 'package:quotes_app/src/shared/colors.dart';

ThemeData darkTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      elevation: 5,
      // side: BorderSide(color: Colors.black, width: 2.5),
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.primaryColor),
  listTileTheme: const ListTileThemeData(
    tileColor: AppColors.primaryColor,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(23),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
  inputDecorationTheme: const InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.textColor,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.textColor,
      ),
    ),
    filled: true,
    fillColor: AppColors.primaryColor,
    hintStyle: TextStyle(fontSize: 36, color: AppColors.hintColor),
    errorStyle: TextStyle(fontSize: 36, color: AppColors.errorTextColor),
  ),
  backgroundColor: AppColors.backgroundColor,
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.textColor,
  fontFamily: "HiMelody",
  textTheme: const TextTheme(
    headline2: TextStyle(fontSize: 96),
    headline3: TextStyle(fontSize: 48),
    headline4: TextStyle(fontSize: 36),
    headline5: TextStyle(fontSize: 32),
    headline6: TextStyle(fontSize: 24),
  ).apply(bodyColor: AppColors.textColor, displayColor: AppColors.textColor),
);
