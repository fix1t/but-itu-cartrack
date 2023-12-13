class Expense {
  final String id;
  final String description;
  final double amount;
  final DateTime date;

  Expense({
    this.id = '',
    this.description = '',
    this.amount = 0.0,
    DateTime? date,
  }) : date = date ?? DateTime.now();


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
