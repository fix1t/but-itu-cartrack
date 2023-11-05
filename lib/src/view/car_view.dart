import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/model/car_model.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';

class CarView extends StatelessWidget {
  final CarController userController;
  final TextEditingController _nameController = TextEditingController();

  CarView(this.userController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car List'),
      ),
      body: StreamBuilder<List<Car>>(
        stream: userController.users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No cars found'));
          } else {
            List<Car> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index].name),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final nameController = TextEditingController();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Car'),
                content: TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      final name = nameController.text.trim();
                      if (name.isNotEmpty) {
                        userController.addCar(name);
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
        child: Icon(Icons.add),
      ),
    );
  }
}
