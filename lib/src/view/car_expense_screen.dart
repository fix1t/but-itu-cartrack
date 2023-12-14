import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/expense_controller.dart';
import 'package:itu_cartrack/src/model/expense.dart';
import 'package:itu_cartrack/src/model/car.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';

class CarExpenseScreen extends StatelessWidget {
  final Car selectedCar = CarController.activeCar;

  CarExpenseScreen(); // Empty body added here

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
                  title: Text('${expenses[index].description} - ${expenses[index].amount}'),
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
      // Uncomment and implement _showAddExpenseDialog if needed
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () => _showAddExpenseDialog(context),
      //     child: Icon(Icons.add),
      //     heroTag: 'addExpenseFAB' // Unique heroTag
      // ),
    );
  }
}
/*
  void _showAddExpenseDialog(BuildContext context) {
    final descriptionController = TextEditingController();
    final amountController = TextEditingController();
    // Additional controllers for other expense fields

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Expense'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
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
                final description = descriptionController.text.trim();
                final amount = double.tryParse(amountController.text.trim()) ?? 0.0;
                // Validation and parsing for other fields

                if (description.isNotEmpty && amount > 0) {
                  Expense expense = Expense(
                    description: description,
                    amount: amount,
                    // Set other fields of the Expense object
                  );

                  ExpenseController().addExpense(selectedCar.id);
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
*/

