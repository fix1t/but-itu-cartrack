import 'package:flutter/material.dart';

class CarDetailScreen extends StatelessWidget {
  CarDetailScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Detail Screen'),
      ),
      body: Center(
        child: Text('Car Detail'),
      ),
    );
  }
}
