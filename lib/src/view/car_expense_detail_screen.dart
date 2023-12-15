import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/model/expense.dart';
import 'package:itu_cartrack/src/controller/user_controller.dart';
import 'package:itu_cartrack/src/model/user.dart';
import 'package:itu_cartrack/src/controller/expense_controller.dart';

class CarExpenseDetailScreen extends StatefulWidget {
  CarExpenseDetailScreen({Key? key}) : super(key: key);

  @override
  _CarExpenseDetailScreenState createState() => _CarExpenseDetailScreenState();
}

class _CarExpenseDetailScreenState extends State<CarExpenseDetailScreen> {
  final Expense? expense = ExpenseController().activeExpense;
  String userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    if (expense != null && expense!.userId.isNotEmpty) {
      // Assuming UserController has a method to get user by ID
      User? user = await UserController().getUserById(expense!.userId);
      if (user != null) {
        setState(() {
          userName = user.name;
        });
      }
    }
  }

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
            Text('User who created the expense: $userName')
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
