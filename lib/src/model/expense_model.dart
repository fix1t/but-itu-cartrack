import 'package:firebase_database/firebase_database.dart';
import 'package:itu_cartrack/src/model/expense.dart';

class ExpenseModel {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  ExpenseModel();

  // Add an expense to a specific car
  Future<void> addExpense(String carId, Expense expense) async {
    DatabaseReference expenseRef = databaseReference.child('cars').child(carId).child('expenses').push();
    await expenseRef.set(expense.toMap());
  }

  // Delete an expense from a specific car
  Future<void> deleteExpense(String carId, String expenseId) async {
    await databaseReference.child('cars').child(carId).child('expenses').child(expenseId).remove();
  }
/* //maybe works, needs testing
  // Update an expense for a specific car
  Future<void> updateExpense(String carId, String expenseId, Expense expense) async {
    await databaseReference.child('cars').child(carId).child('expenses').child(expenseId).update(expense.toMap());
  }
*/
  // Stream to get expenses for a specific car
  Stream<List<Expense>> getExpenses(String carId) {
    return databaseReference.child('cars').child(carId).child('expenses').onValue.map((event) {
      var snapshot = event.snapshot;
      var data = snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        List<Expense> expenseList = [];
        data.forEach((key, value) {
          if (value is Map<Object?, Object?>) {
            expenseList.add(Expense.fromMap(key, value.cast<String, dynamic>()));
          }
        });
        return expenseList;
      }
      return [];
    });
  }
}
