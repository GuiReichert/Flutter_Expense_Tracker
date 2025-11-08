import 'package:expense_tracker/Models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expensesList});

  final List<ExpenseModel> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => expenseItem(expensesList[index]),
    );
  }

  Widget expenseItem(ExpenseModel expense) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Text(expense.title),
      ),
    );
  }
}
