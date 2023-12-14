import 'package:flutter/material.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';
import 'package:itu_cartrack/src/controller/note_controller.dart';
import 'package:itu_cartrack/src/model/note.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarNotesScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final Car selectedCar = CarController.activeCar;
  final String currentUserId = LoginController().getCurrentUserId();
  NoteController noteController = NoteController();

  CarNotesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Note>>(
              stream: noteController.getNotes(selectedCar.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No notes found'));
                } else {
                  List<Note> notes = snapshot.data!;
                  return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(notes[index].content),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: noteInputField(context),
          ),
        ],
      ),
    );
  }

  Row noteInputField(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            // TODO: Send an image
          },
          icon: Icon(Icons.attach_file),
        ),
        Expanded(
          child: TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.primary.withAlpha(100),
              hintText: 'Type a note message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  String message = _messageController.text;
                  noteController.addNote(Note(userId: currentUserId, content: message), selectedCar.id);
                  // TODO: Implement logic to send the message
                  _messageController.clear();
                },
                icon: Icon(Icons.send),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
