import 'package:expense_tracker/Dummy%20Data/expense_list.dart';
import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Custom%20Widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _registeredExpenses = expensesList;

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Chart'),
          Expanded(
            child: ExpensesList(expensesList: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
