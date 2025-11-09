import 'package:expense_tracker/Utils/theme_data.dart';
import 'package:expense_tracker/views/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //permite apenas a orientação selecionada
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(colorScheme: kDarkModeColorScheme),
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: kcardTheme,
          elevatedButtonTheme: kElevatedButtonTheme,
        ),
        // themeMode: ThemeMode.system, default
        home: Expenses(),
      ),
    );
  });
}
