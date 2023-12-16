import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/expense_controller.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';
import 'package:itu_cartrack/src/model/expense.dart';
import 'package:itu_cartrack/src/model/car.dart';
import 'package:itu_cartrack/src/view/car_expense_detail_screen.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';

class CarExpenseScreen extends StatefulWidget {
  final Car selectedCar = CarController.activeCar;

  CarExpenseScreen();

  @override
  _CarExpenseScreenState createState() => _CarExpenseScreenState();
}

class _CarExpenseScreenState extends State<CarExpenseScreen> {
  final Car selectedCar = CarController.activeCar;
  final String currentUserId = LoginController().getCurrentUserId();
  ExpenseType selectedType = ExpenseType.fuel; // Default type

  final Map<ExpenseType, IconData> _expenseTypeIcons = {
    ExpenseType.fuel: Icons.local_gas_station,
    ExpenseType.maintenance: Icons.build,
    ExpenseType.repair: Icons.handyman,
    ExpenseType.insurance: Icons.shield,
    ExpenseType.other: Icons.more_horiz,
  };

  void _showAddExpenseDialog(BuildContext context) {
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          // This is used to set state within the dialog
          builder: (context, setModalState) {
            return AlertDialog(
              title: Text('Add Expense'),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    DropdownButton<ExpenseType>(
                      value: selectedType,
                      onChanged: (ExpenseType? newValue) {
                        setModalState(() {
                          // This will rebuild the modal with the new value
                          selectedType = newValue!;
                        });
                      },
                      items: ExpenseType.values
                          .map<DropdownMenuItem<ExpenseType>>(
                              (ExpenseType value) {
                        return DropdownMenuItem<ExpenseType>(
                          value: value,
                          child: Text(expenseTypeToString(value)),
                        );
                      }).toList(),
                    ),
                    TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        //TODO: fix errorText
                        errorText: (amountController.text.isNotEmpty
                                ? int.parse(amountController.text) <= 0
                                : true)
                            ? 'Amount must be greater than 0'
                            : null,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    final amount =
                        double.tryParse(amountController.text.trim()) ?? 0.0;
                    if (amount > 0) {
                      ExpenseController().addExpense(widget.selectedCar.id,
                          type: selectedType,
                          userID: currentUserId,
                          amount: amount,
                          date: DateTime.now());
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense List',
            style: TextStyle(color: theme.colorScheme.onPrimary)),
        backgroundColor: theme.colorScheme.primary,
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
                return GestureDetector(
                  onTap: () {
                    // Set the active expense when tapped
                    ExpenseController().setActiveExpense(expenses[index]);

                    // Navigate to the expense details screen
                    Navigator.pushNamed(context, '/car/expense/detail');
                  },
                  child: ListTile(
                    title: Text(
                      '${expenses[index].amount.toStringAsFixed(2)} CZK - ${expenses[index].type.name.substring(0, 1).toUpperCase() + expenses[index].type.name.substring(1)}',
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      'Date: ${expenses[index].date.toLocal().toString().split(' ')[0]}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: Icon(
                      _expenseTypeIcons[expenses[index].type],
                      // Get the icon based on the expense type
                      color: theme.colorScheme.primary,
                    ),
                    onTap: () {
                      // Handle the tap event, for example, navigate to the expense details
                      ExpenseController().setActiveExpense(expenses[index]);
                      Navigator.pushNamed(context, '/car/expense/detail');
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
}
