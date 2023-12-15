import 'package:itu_cartrack/src/model/expense_model.dart';
import 'package:itu_cartrack/src/model/expense.dart';

class ExpenseController {
  final ExpenseModel expenseModel;
  Expense? activeExpense; // Variable to hold the active expense

  // Private constructor for the Singleton pattern
  ExpenseController._private(this.expenseModel);

  static final ExpenseController _instance = ExpenseController._private(ExpenseModel());

  factory ExpenseController() {
    return _instance;
  }

  // Stream to get expenses for a specific car
  Stream<List<Expense>> getExpenses(String carId) => expenseModel.getExpenses(carId);

  // Add an expense to a specific car
  Future<void> addExpense(String carId, {
    required ExpenseType type,
    required String userID,
    required double amount,
    required DateTime date,
  }) async {
    Expense expense = Expense(
      id: '',
      userId: userID,
      type: type,
      amount: amount,
      date: date,
    );

    await expenseModel.addExpense(carId, expense);
  }

  // Delete an expense from a specific car
  Future<void> deleteExpense(String carId, String expenseId) async {
    await expenseModel.deleteExpense(carId, expenseId);
  }

// Update an expense for a specific car (if needed)
// Uncomment and modify if needed
/*
  Future<void> updateExpense(String carId, String expenseId, Expense expense) async {
    await expenseModel.updateExpense(carId, expenseId, expense);
  }
  */

  // Set the active expense
  void setActiveExpense(Expense expense) {
    activeExpense = expense;
  }

  // Get the active expense
  Expense? getActiveExpense() {
    return activeExpense;
  }
}
