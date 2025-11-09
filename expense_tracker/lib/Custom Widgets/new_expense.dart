import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Utils/Enums/expense_categories.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onSubmitExpense});

  final Function(ExpenseModel expense) onSubmitExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _pickedDate;
  ExpenseCategories? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now.add(Duration(days: -365)),
      lastDate: now.add(Duration(days: 365)),
    );

    setState(() {
      _pickedDate = pickedDate;
    });
  }

  void _submitEspenseData() {
    try {
      _validateExpenseData();
      widget.onSubmitExpense(
        ExpenseModel(
          title: _titleController.text,
          amount: double.parse(_amountController.text),
          date: _pickedDate!,
          category: _selectedCategory!,
        ),
      );
      Navigator.pop(context);
    } catch (ex) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Alert'),
          content: Text(ex.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  void _validateExpenseData() {
    final amount = double.tryParse(_amountController.text);

    if (amount == null || amount <= 0) throw Exception('Amount invalid.');
    if (_titleController.text.trim().isEmpty) throw Exception('Title invalid');
    if (_pickedDate == null) throw Exception('Date not selected');
    if (_selectedCategory == null) throw Exception('Category not selected');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 15, 25, 25),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            onChanged: (String input) {},
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _pickedDate == null
                          ? 'Select Date'
                          : DateFormat.yMd().format(_pickedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: ExpenseCategories.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _submitEspenseData,
                child: Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
