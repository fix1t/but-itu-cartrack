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

  // Icons for each expense type using Material Icons
  final Map<ExpenseType, IconData> _expenseIcons = {
    ExpenseType.fuel: Icons.local_gas_station,
    ExpenseType.maintenance: Icons.build,
    ExpenseType.repair: Icons.build_circle,
    ExpenseType.insurance: Icons.shield,
    ExpenseType.other: Icons.more_vert,
  };

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    if (expense != null && expense!.userId.isNotEmpty) {
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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Details',style: TextStyle(color: theme.colorScheme.onSecondary)),
        backgroundColor: theme.colorScheme.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(
                _expenseIcons[expense?.type] ?? Icons.error_outline, // Default to error icon if type is null
                color: theme.colorScheme.secondary,
                size: 36,
              ),
              title: Text('Amount: ${expense?.amount.toStringAsFixed(2)} CZK',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(
                'Date: ${expense?.date.toLocal().toString().split(' ')[0]}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Text('User who created the expense:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(height: 15),
            Text('$userName',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 20),
            Text('Type: ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(height: 15),
            Text('${expense?.type.name}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
