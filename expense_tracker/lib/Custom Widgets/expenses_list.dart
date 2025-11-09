import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Utils/Enums/expense_categories.dart';
import 'package:expense_tracker/Utils/theme_data.dart';
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
        background: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Icon(Icons.delete),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        child: expenseItem(expensesList[index]),
      ),
    );
  }

  Widget expenseItem(ExpenseModel expense) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: kTextTheme.titleLarge?.copyWith(fontSize: 14),
            ),
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
