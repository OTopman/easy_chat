import 'package:easy_chat/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ultraMarineBlue,
      selectionHandleColor: ultraMarineBlue,
      selectionColor: ultraMarineBlue,
    ),
    snackBarTheme: SnackBarThemeData(
      closeIconColor: ultraMarineBlue,
    ),
    primaryColor: cultured,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: cultured,
    )
        .copyWith(
          secondary: white,
          brightness: Brightness.light,
        )
        .copyWith(
          background: cultured,
        ),
    fontFamilyFallback: const ['Graphik'],
    
    inputDecorationTheme: InputDecorationTheme(
      fillColor: cultured,
      filled: true,
      labelStyle: TextStyle(
        fontSize: 8.0.sp,
        fontWeight: FontWeight.w100,
      ),
      focusColor: cultured,
      floatingLabelStyle: TextStyle(
        fontSize: 8.0.sp,
        fontWeight: FontWeight.w100,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: philippineSilver,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(width: 1, color: philippineSilver),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: philippineSilver),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(width: 1, color: cultured),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
    ),
    buttonTheme: ButtonThemeData(
      height: 376.0.sp,
      colorScheme: ColorScheme.light(
        background: ultraMarineBlue,
      ),
      buttonColor: ultraMarineBlue,
      minWidth: 100.0.h
    ),
    primaryColorDark: cultured,
    primaryColorLight: cultured,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: black,
        fontFamily: 'Graphik',
        fontWeight: FontWeight.w500,
        fontSize: 18.0.sp,
        // fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: black,
        fontFamily: 'Graphik',
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: black,
        fontFamily: 'Graphik',
        fontSize: 8.0.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    fontFamily: 'Graphik',
  );
}
