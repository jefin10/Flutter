import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/ex.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return  _ExpensesState();    
  }

  
}
class _ExpensesState extends State<Expenses>{
   final List<Ex> _registeredExpenses = [
    Ex(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Ex(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  void _addOpenAddOverlay(){
   showModalBottomSheet(context: context, builder: (ctx) => NewExpenses(onAddExpense: _addNewExpense ,));

  }
  void _addNewExpense(Ex expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }
  void removeExpense(Ex expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _addOpenAddOverlay
            ,
            icon: const Icon(Icons.add),
          ),
        ],),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("the chart"),

          Expanded(child: ExpensesList(expenses: _registeredExpenses , onRemoveExpense: removeExpense,) ) 
        ],
      )
    );
  }
}