class Expense {
  final String id;
  final String description;
  final double amount;
  final DateTime date;

  Expense({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
  });

  factory Expense.fromMap(String id, Map<String, dynamic> data) {
    return Expense(
      id: id,
      description: data['description'] ?? '',
      amount: (data['amount'] ?? 0.0).toDouble(),
      date: DateTime.parse(data['date'] ?? ''),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }
}
