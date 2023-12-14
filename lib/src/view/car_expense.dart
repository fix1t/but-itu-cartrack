import 'package:flutter/material.dart';

class CarExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Expense Screen'),
      ),
      body: Center(
        child: Text('Car Expenses'),
      ),
    );
  }
}
