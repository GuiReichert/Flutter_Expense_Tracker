import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Utils/Enums/expense_categories.dart';

var expensesList = [
  ExpenseModel(
    title: 'Flutter Course',
    amount: 19.99,
    date: DateTime.now(),
    category: ExpenseCategories.studies,
  ),
  ExpenseModel(
    title: 'Cinema',
    amount: 15.69,
    date: DateTime(2025, 08, 07),
    category: ExpenseCategories.leisure,
  ),
];
