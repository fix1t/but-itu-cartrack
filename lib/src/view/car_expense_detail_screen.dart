import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';
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
  Expense? expense = ExpenseController().activeExpense;
  final Car selectedCar = CarController().getActiveCar();
  String userName = '';
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  ExpenseType? _selectedType;
  bool _isEditing = false;

  // Icons for each expense type using Material Icons
  final Map<ExpenseType, IconData> _expenseIcons = {
    ExpenseType.fuel: Icons.local_gas_station,
    ExpenseType.maintenance: Icons.build,
    ExpenseType.repair: Icons.build_circle,
    ExpenseType.insurance: Icons.shield,
    ExpenseType.other: Icons.more_vert,
  };

  Future<void> _loadUserName() async {
    if (expense != null && expense!.userId.isNotEmpty) {
      User? user = await UserController().getUserById(expense!.userId);
      if (user != null) {
        setState(() {
          _userNameController.text = user.name;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (expense != null) {
      _amountController.text = expense!.amount.toStringAsFixed(2);
      _selectedType = expense!.type;
      _loadUserName();
    }
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _deleteExpense() {
    // Delete the expense
    ExpenseController().deleteExpense(selectedCar.id, expense!.id);
    Navigator.pop(context); // Go back to the previous screen
  }

  void _saveChanges() async {
    if (_isEditing) {
      double updatedAmount = double.tryParse(_amountController.text) ?? 0.0;
      ExpenseType updatedType = _selectedType ?? ExpenseType.other;

      // Perform save logic, update the expense, etc.
      Expense updatedExpense = Expense(
        id: expense!.id,
        userId: expense!.userId,
        type: updatedType,
        amount: updatedAmount,
        date: expense!.date, // Keep the original date
      );

      // Call a method in the ExpenseController to update the expense
      await ExpenseController()
          .updateExpense(selectedCar.id, expense!.id, updatedExpense);

      // Update the local state to reflect the changes
      setState(() {
        expense = updatedExpense; // Update the expense in the state
        _amountController.text = updatedAmount.toStringAsFixed(2);
        _selectedType = updatedType;
      });
    }
    _toggleEditing(); // Exit editing mode
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Details',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        backgroundColor: theme.colorScheme.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_isEditing) ...[
              // Editable fields for amount and type
              _buildEditableFields(),
            ] else ...[
              // Display fields
              _buildDisplayFields(theme),
            ],
            // Action buttons
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableFields() {
    return Column(
      children: [
        DropdownButtonFormField<ExpenseType>(
          value: _selectedType,
          onChanged: (newValue) => setState(() => _selectedType = newValue),
          items: ExpenseType.values.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(type.toString().split('.').last.substring(0, 1).toUpperCase() + type.toString().split('.').last.substring(1)),
            );
          }).toList(),
        ),
        TextField(
          controller: _amountController,
          decoration: InputDecoration(labelText: 'Amount (CZK)'),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
      ],
    );
  }

  Widget _buildDisplayFields(ThemeData theme) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            _expenseIcons[expense?.type ?? ExpenseType.other],
            color: theme.colorScheme.secondary,
            size: 36,
          ),
          title: Text(
            'Amount: ${_amountController.text} CZK',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Date: ${expense?.date.toLocal().toString().split(' ')[0]}',
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(height: 20),
        Text('Created by: ${_userNameController.text}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        Text('Type: ${expense!.type.name.substring(0, 1).toUpperCase() + expense!.type.name.substring(1)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (_isEditing)
          ElevatedButton(
            onPressed: _toggleEditing,
            child: Text('Cancel'),
          ),
        if (_isEditing)
          ElevatedButton(
            onPressed: _saveChanges,
            child: Text('Save'),
          ),
        if (!_isEditing)
          ElevatedButton(
            onPressed: _toggleEditing,
            child: Text('Edit'),
          ),
        if (!_isEditing)
          ElevatedButton(
            onPressed: _deleteExpense,
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.error.withOpacity(0.8)),
            child: Text(
              'Delete',
              style: TextStyle(color: Theme.of(context).colorScheme.onError),
            ),
          ),
      ],
    );
  }
}
