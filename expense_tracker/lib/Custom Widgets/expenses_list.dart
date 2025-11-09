import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Utils/Enums/expense_categories.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expensesList,
    required this.removeItem,
  });

  final Function(ExpenseModel expense) removeItem;
  final List<ExpenseModel> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenseItem(expensesList[index])),
        onDismissed: (direction) => {removeItem(expensesList[index])},
        child: expenseItem(expensesList[index]),
      ),
    );
  }

  Widget expenseItem(ExpenseModel expense) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 4),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
