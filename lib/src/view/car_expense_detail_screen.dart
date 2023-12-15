import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/model/expense.dart';
import 'package:itu_cartrack/src/controller/expense_controller.dart';

class CarExpenseDetailScreen extends StatelessWidget {
  final Expense? expense = ExpenseController().activeExpense;

  CarExpenseDetailScreen({expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amount: ${expense?.amount} Czk'),
            Text('Type: ${expense?.type.name}'),
            Text(
              'Date: ${expense?.date.toLocal().toString().split(' ')[0]}',
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
