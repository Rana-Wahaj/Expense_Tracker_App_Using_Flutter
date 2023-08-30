import 'package:expense_app/model_expense.dart';
import 'package:flutter/material.dart';
//import 'package:expense_app/expense_display.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.addbythismethod});
  final void Function(ExpenseData expense) addbythismethod;
  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  final _titleCntler = TextEditingController();
  final _costCntlrt = TextEditingController();
  DateTime? _choosedDate;
  var _choosedCategory = Category.leisure;

  void _submitAndShowErrorMsg() {
    final enteredAmnt = double.tryParse(_costCntlrt.text);
    final isAmountCorrect = enteredAmnt == null || enteredAmnt <= 0;
    if (_titleCntler.text.trim().isEmpty ||
        isAmountCorrect ||
        _choosedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Invalid Input'),
              content:
                  const Text('Try entering the correct title, cost, date.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text('Okay'),
                )
              ],
            );
          });
      return;
    } else {
      final enteredAmnt = double.tryParse(_costCntlrt.text);
      final exp = ExpenseData(
          title: _titleCntler.text,
          amnt: enteredAmnt!,
          category: _choosedCategory,
          date: _choosedDate!);
      _choosedDate = null;
      _costCntlrt.text = '';
      _titleCntler.text = '';
      widget.addbythismethod(exp);
      Navigator.pop(context);
    }
  }

  void _datePicker() async {
    final now = DateTime.now();
    final frstDate = DateTime(now.year - 1, now.month, now.day);
    final dateChoosed = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: frstDate,
      lastDate: now,
    );
    setState(() {
      _choosedDate = dateChoosed;
    });
  }

  @override
  void dispose() {
    _titleCntler.dispose();
    _costCntlrt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleCntler,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _costCntlrt,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: 'PKR ',
                    label: Text('Cost'),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_choosedDate == null
                      ? 'No Date Picked'
                      : formatter.format(_choosedDate!)),
                  IconButton(
                    onPressed: _datePicker,
                    icon: const Icon(Icons.date_range),
                  )
                ],
              ))
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _choosedCategory,
                items: Category.values
                    .map(
                      (cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(
                          cat.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  // if (_choosedCategory == null) {
                  //   return;
                  // }
                  setState(() {
                    _choosedCategory = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: _submitAndShowErrorMsg,
                child: const Text('Save Expense'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
