import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category { leisure, food, travel, work }

final categoryIcons = {
  Category.leisure: Icons.movie,
  Category.food: Icons.dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work
};
final formatter = DateFormat.yMd();

const uuid = Uuid();

class ExpenseData {
  String title;
  String id;
  double amnt;
  Category category;
  DateTime date;

  ExpenseData({
    required this.title,
    required this.amnt,
    required this.category,
    required this.date,
  }) : id = uuid.v4();

  get dateFormat {
    return formatter.format(date);
  }
}

class ExpenseScheme {
  List<ExpenseData>? expensesList;
  Category? category;
  ExpenseScheme({required this.expensesList, this.category});

  ExpenseScheme.ofCategory(
      {required List<ExpenseData> expenses, required this.category}) {
    List<ExpenseData> e = [];
    for (final exp in expenses) {
      if (exp.category == category) {
        e.add(exp);
      }
    }
    expensesList = e;
  }

  double sum = 0;
  double get totalExpenses {
    if (expensesList == null) {
      return sum;
    } else {
      for (final exp in expensesList!) {
        sum += exp.amnt;
      }
      return sum;
    }
  }
}
