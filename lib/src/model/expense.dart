enum ExpenseType {
  fuel,
  maintenance,
  repair,
  insurance,
  other,
}

String expenseTypeToString(ExpenseType type) {
  return type.toString().split('.').last;
}

ExpenseType expenseTypeFromString(String typeString) {
  return ExpenseType.values.firstWhere(
        (e) => e.toString().split('.').last == typeString,
    orElse: () => ExpenseType.other, // Default value if not found
  );
}
class Expense {
  final String id;
  final String userId;
  final ExpenseType type;
  final double amount;
  final DateTime date;

  Expense({
    this.id = '',
    required this.userId,
    required this.type,
    this.amount = 0.0,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  factory Expense.fromMap(String id, Map<String, dynamic> data) {
    return Expense(
      id: id,
      userId: data['userId'] ?? '',
      type: expenseTypeFromString(data['type'] ?? 'Other'),
      amount: (data['amount'] ?? 0.0).toDouble(),
      date: DateTime.tryParse(data['date'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': expenseTypeToString(type),
      'userId': userId,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }
}
