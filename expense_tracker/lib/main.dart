import 'package:expense_tracker/views/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(useMaterial3: true),
      home: Expenses(),
    ),
  );
}
