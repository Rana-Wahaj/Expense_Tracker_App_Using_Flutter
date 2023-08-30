import 'package:flutter/material.dart';
import 'package:expense_app/model_expense.dart';
import 'package:expense_app/display_expense_as_card.dart';

class ExpenseDisplay extends StatelessWidget {
  final List<ExpenseData> expenseList;
  final void Function(ExpenseData exp) onDissmissed;
  const ExpenseDisplay(
      {super.key, required this.expenseList, required this.onDissmissed});

  @override
  Widget build(context) {
    return Expanded(
        child: ListView.builder(
            itemCount: expenseList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                  background: Container(
                    color: const Color.fromARGB(255, 234, 115, 115),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  ),
                  key: ValueKey(expenseList[index]),
                  onDismissed: (direction) {
                    onDissmissed(expenseList[index]);
                  },
                  child: ExpenseAsCard(data: expenseList[index]));
            }));
  }
}
