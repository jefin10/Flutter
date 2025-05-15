import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/ex.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,

  });
  final List<Ex> expenses;
  final void Function(Ex expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {

    return  ListView.builder(itemCount: expenses.length,  itemBuilder: (ctx,index) => Dismissible(key: ValueKey(expenses[index].id),
     onDismissed:  ( direction) {
        onRemoveExpense(expenses[index]);
      },
      child: ExpenseItem(expenses[index])));
  }
}