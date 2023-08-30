import 'package:expense_app/model_expense.dart';
import 'package:flutter/material.dart';

class ExpenseAsCard extends StatelessWidget {
  final ExpenseData data;
  const ExpenseAsCard({required this.data, super.key});
  @override
  Widget build(context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            data.title,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const SizedBox(width: 15),
              Text('PKR ${(data.amnt).toStringAsFixed(2)}'),
              const Spacer(),
              Icon(categoryIcons[data.category]),
              const SizedBox(width: 5),
              Text((data.dateFormat).toString()),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
