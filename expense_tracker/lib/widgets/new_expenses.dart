import 'package:expense_tracker/models/ex.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, this.onAddExpense});
  final void Function(Ex expense)? onAddExpense;

  @override
  State<NewExpenses> createState() {
    return _NewExpenses();
  }
}

class _NewExpenses extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory; // Added category state

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  void _submitData() {
  final enteredTitle = _titleController.text;
  final enteredAmount = double.tryParse(_amountController.text);

  if (enteredTitle.isEmpty || enteredAmount == null || enteredAmount <= 0 || _selectedDate == null || _selectedCategory == null) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Invalid Input'),
        content: const Text('Please enter a valid title, amount, date, and category.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
    return;
  }

  // Add the new expense to the list
  widget.onAddExpense?.call(
    Ex(
      title: enteredTitle,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory!,
    ),
  );

  Navigator.pop(context); // Close the input screen
}

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
              hintText: 'Enter a title',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                    hintText: 'Enter an amount',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Selected'
                            : DateFormat.yMMMd().format(_selectedDate!),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Category Dropdown
          Row(
            children: [
              DropdownButton<Category>(
                hint: const Text("Select Category"),
                value: _selectedCategory,
                items: Category.values.map(
                  (category) {
                    return DropdownMenuItem<Category>(
                      value: category,
                      child: Text(category.name.toString()),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text("Add Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
