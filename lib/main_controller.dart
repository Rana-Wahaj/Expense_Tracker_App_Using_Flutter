import 'package:expense_app/add_expense.dart';
import 'package:expense_app/chart.dart';
import 'package:expense_app/model_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/expense_display.dart';
import 'package:expense_app/sort.dart';

class MainController extends StatefulWidget {
  const MainController({super.key});
  @override
  State<MainController> createState() {
    return _MainControllerState();
  }
}

class _MainControllerState extends State<MainController> {
  Widget? mainBody;

  List<ExpenseData> expenseList = [
    ExpenseData(
      title: 'Movie Night',
      amnt: 1000.0,
      category: Category.leisure,
      date: DateTime.now(),
    ),
    ExpenseData(
      title: 'Dinner at Restaurant',
      amnt: 4000.0,
      category: Category.food,
      date: DateTime.now(),
    ),
    ExpenseData(
      title: 'Flight to Paris',
      amnt: 2550.0,
      category: Category.travel,
      date: DateTime.now(),
    ),
    ExpenseData(
      title: 'Office Supplies',
      amnt: 1300.0,
      category: Category.work,
      date: DateTime.now(),
    ),
  ];

  void addExpenseToExpenseList(ExpenseData expense) {
    setState(() {
      expenseList.add(expense);
    });
  }

  void removeExpense(ExpenseData exp) {
    final indexExpDeleted = expenseList.indexOf(exp);
    setState(() {
      expenseList.remove(exp);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                expenseList.insert(indexExpDeleted, exp);
              });
            }),
        content: Text('Expense of ${formatter.format(exp.date)} Deleted'),
      ),
    );
  }

  void addExpensesToRecord() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => AddExpense(
              addbythismethod: addExpenseToExpenseList,
            ));
  }

  @override
  Widget build(BuildContext context) {
    if (expenseList.isNotEmpty) {
      mainBody = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Chart(listOfExpense: expenseList),
            const SizedBox(height: 30),
            DropdownButton(
                value: 'Sort by amount',
                items: const [
                  DropdownMenuItem(
                      value: 'Sort by amount', child: Text('Sort by amount')),
                  DropdownMenuItem(
                      value: 'Sort by date', child: Text('Sort by date')),
                ],
                onChanged: (value) {
                  Sort s = Sort();
                  setState(() {
                    if (value == 'Sort by amount') {
                      expenseList = s.sortbyAmount(expenses: expenseList);
                    } else if (value == 'Sort by date') {
                      expenseList = s.sortbyDate(expenses: expenseList);
                    }
                  });
                }),
            const SizedBox(height: 10),
            ExpenseDisplay(
              onDissmissed: removeExpense,
              expenseList: expenseList,
            ),
          ],
        ),
      );
    } else {
      mainBody = const Center(
        child: Text('No Expense, try adding some'),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Tracker",
          style: TextStyle(fontSize: 23),
        ),
        actions: [
          IconButton(
            onPressed: addExpensesToRecord,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: mainBody,
    );
  }
}
