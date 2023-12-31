import 'package:flutter/material.dart';

MaterialColor ultraMarineBlue = createMaterialColor(const Color(0xff4369F1));
MaterialColor cultured = createMaterialColor(const Color(0xfff5f5f5));
MaterialColor culturedAlt = createMaterialColor(const Color(0xffc5c5c5));
MaterialColor white = createMaterialColor(const Color(0xffffffff));
MaterialColor black = createMaterialColor(const Color(0xff000000));
MaterialColor philippineSilver = createMaterialColor(const Color(0xffb4b1b1));

MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final double strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
