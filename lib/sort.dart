import 'package:expense_app/model_expense.dart';

class Sort {
  List<ExpenseData> sortbyAmount({required List<ExpenseData> expenses}) {
    for (var i = 0; i < expenses.length - 1; i++) {
      for (var j = 0; j < expenses.length - i - 1; j++) {
        if (expenses[j].amnt < expenses[j + 1].amnt) {
          var temp = expenses[j];
          expenses[j] = expenses[j + 1];
          expenses[j + 1] = temp;
        }
      }
    }
    return expenses;
  }

  List<ExpenseData> sortbyDate({required List<ExpenseData> expenses}) {
    for (var i = 0; i < expenses.length - 1; i++) {
      for (var j = 0; j < expenses.length - i - 1; j++) {
        if (expenses[j].date.isAfter(expenses[j + 1].date)) {
          var temp = expenses[j];
          expenses[j] = expenses[j + 1];
          expenses[j + 1] = temp;
        }
      }
    }

    return expenses;
  }
}
