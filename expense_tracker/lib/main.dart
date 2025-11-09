import 'package:expense_tracker/Utils/theme_data.dart';
import 'package:expense_tracker/views/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: kcardTheme,
        elevatedButtonTheme: kElevatedButtonTheme,
      ),
      home: Expenses(),
    ),
  );
}
