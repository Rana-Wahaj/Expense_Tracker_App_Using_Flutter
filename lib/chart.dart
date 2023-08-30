import 'package:expense_app/bars.dart';
import 'package:expense_app/model_expense.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<ExpenseData> listOfExpense;
  const Chart({super.key, required this.listOfExpense});

  List<ExpenseScheme> get barsData {
    return [
      ExpenseScheme.ofCategory(
          expenses: listOfExpense, category: Category.food),
      ExpenseScheme.ofCategory(
          expenses: listOfExpense, category: Category.leisure),
      ExpenseScheme.ofCategory(
          expenses: listOfExpense, category: Category.travel),
      ExpenseScheme.ofCategory(
          expenses: listOfExpense, category: Category.work),
    ];
  }

  double get maxDataForBar {
    double max = 0;

    for (final bar in barsData) {
      if (bar.totalExpenses > max) {
        max = bar.totalExpenses;
      }
    }
    return max;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      height: 180,
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: isDark
              ? [
                  const Color.fromARGB(255, 0, 0, 0),
                  const Color.fromARGB(255, 15, 38, 39)
                ]
              : [
                  const Color.fromARGB(255, 49, 110, 112),
                  const Color.fromARGB(255, 164, 238, 240)
                ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bar in barsData)
                  BarsOfChart(
                      fill: (bar.totalExpenses == 0)
                          ? 0
                          : ((bar.totalExpenses / (maxDataForBar + 180))))
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (final bar in barsData) Icon(categoryIcons[bar.category]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
