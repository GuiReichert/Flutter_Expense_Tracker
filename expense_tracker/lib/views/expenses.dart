import 'dart:ffi';

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
  double _totalAmount = 0;

  @override
  Widget build(context) {
    _recalculateTotal();

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        backgroundColor: Colors.grey[300],
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Text('Chart will come here'),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: _removeAllExpenses,
                  child: Text('Clear'),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: _registeredExpenses.isEmpty
                ? noExpensesWidget()
                : ExpensesList(
                    expensesList: _registeredExpenses,
                    removeItem: _removeExpense,
                  ),
          ),
          Spacer(),
          Card(
            color: Colors.grey[300],
            elevation: 200,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: Center(
                child: Text(
                  'Total: \$ ${_totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget noExpensesWidget() {
    return Center(child: Text('No expenses found. Start adding'));
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(onSubmitExpense: _addExpense);
      },
    );
  }

  void _addExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
      _recalculateTotal();
    });
  }

  void _removeExpense(ExpenseModel expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Enpense deleted.'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(
                expenseIndex,
                expense,
              ); // Retorna no mesmo lugar
              _recalculateTotal();
            });
          },
        ),
      ),
    );
    _recalculateTotal();
  }

  void _removeAllExpenses() {
    setState(() {
      _registeredExpenses.clear();
      _recalculateTotal();
    });
  }

  void _recalculateTotal() {
    _totalAmount = _registeredExpenses.fold(
      0.0,
      (sum, item) => sum + item.amount,
    );
  }
}
