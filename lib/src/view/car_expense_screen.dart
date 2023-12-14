import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/expense_controller.dart';
import 'package:itu_cartrack/src/model/expense.dart';
import 'package:itu_cartrack/src/model/car.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';

class CarExpenseScreen extends StatelessWidget {
  final Car selectedCar = CarController.activeCar;

  CarExpenseScreen();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense List'),
        backgroundColor: theme.colorScheme.secondary,
      ),
      body: StreamBuilder<List<Expense>>(
        stream: ExpenseController().getExpenses(selectedCar.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No expenses found'));
          } else {
            List<Expense> expenses = snapshot.data!;
            return ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${expenses[index].amount} Czk - ${expenses[index].type.name}'),
                  subtitle: Text('Date: ${expenses[index].date.toLocal().toString().split(' ')[0]}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_outline),
                    color: theme.colorScheme.primary,
                    onPressed: () {
                      ExpenseController().deleteExpense(selectedCar.id, expenses[index].id);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddExpenseDialog(context),
        child: Icon(Icons.add),
        heroTag: 'addExpenseFAB',
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context) {
    final amountController = TextEditingController();
    ExpenseType selectedType = ExpenseType.fuel; // Default type

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Expense'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                DropdownButton<ExpenseType>(
                  value: selectedType,
                  onChanged: (ExpenseType? newValue) {
                    if (newValue != null) {
                      selectedType = newValue;
                    }
                  },
                  items: ExpenseType.values.map<DropdownMenuItem<ExpenseType>>((ExpenseType value) {
                    return DropdownMenuItem<ExpenseType>(
                      value: value,
                      child: Text(expenseTypeToString(value)),
                    );
                  }).toList(),
                ),
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                // Additional TextFields for other expense fields
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final amount = double.tryParse(amountController.text.trim()) ?? 0.0;

                if (amount > 0) {
                  Expense expense = Expense(
                    id: '',
                    type: selectedType,
                    amount: amount,
                    date: DateTime.now(),
                  );

                  ExpenseController().addExpense(selectedCar.id, type: selectedType, amount: amount, date: DateTime.now());
                  Navigator.of(context).pop();
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
