import 'package:expense_tracker/Custom%20Widgets/new_expense.dart';
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
      appBar: AppBar(
        title: Text('Expense Tracker'),
        backgroundColor: Colors.blueAccent[100],
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Text('Chart will come here'),
          Expanded(
            child: ExpensesList(expensesList: _registeredExpenses),
          ),
        ],
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return NewExpense();
      },
    );
  }
}
