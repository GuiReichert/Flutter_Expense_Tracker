import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);

var kcardTheme = CardThemeData().copyWith(
  color: kColorScheme.secondaryContainer,
);

var kElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: kColorScheme.secondaryFixedDim,
  ),
);

var kTextTheme = TextTheme().copyWith(
  titleLarge: ThemeData().textTheme.titleLarge?.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
);
