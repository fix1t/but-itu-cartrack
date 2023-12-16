import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itu_cartrack/src/controller/login_controller.dart';
import 'package:itu_cartrack/src/controller/note_controller.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/model/note.dart';
import 'package:itu_cartrack/src/model/car.dart';

class CarNotesScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final Car selectedCar = CarController.activeCar;
  final String currentUserId = LoginController().getCurrentUserId();
  final String currentUserName = LoginController().getCurrentUserName();
  NoteController noteController = NoteController();

  CarNotesScreen();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text('Notes',
          style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
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
                      final message = notes[index].content;
                      final senderId = notes[index].userId;

                      return Column(
                        crossAxisAlignment: (currentUserId == senderId)
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Row(
                              mainAxisAlignment: (currentUserId == senderId)
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                (currentUserId == senderId)
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            DateFormat('dd-MM-yyyy HH:mm')
                                                .format(notes[index].createdAt),
                                          ),
                                          const SizedBox(width: 6.0),
                                          Text(
                                            currentUserName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            notes[index].userName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(width: 6.0),
                                          Text(
                                            DateFormat('dd-MM-yyyy HH:mm')
                                                .format(notes[index].createdAt),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                          messageBubble(
                              context, currentUserId, senderId, message),
                        ],
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
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 12.0),
        //   child: IconButton(
        //     onPressed: () {
        //       // TODO: Send an image
        //     },
        //     icon: Icon(Icons.attach_file),
        //   ),
        // ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: TextFormField(
              controller: _messageController,
              maxLines: null, // Allow multiple lines
              keyboardType: TextInputType.multiline, // Enable multiline input
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
                    noteController.addNote(
                        Note(userId: currentUserId, content: message, userName: currentUserName),
                        selectedCar.id);
                    _messageController.clear();
                  },
                  icon: Icon(Icons.send),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget messageBubble(
    BuildContext context, String currentUserId, String sender, String message) {
  final size = MediaQuery.sizeOf(context);

  final alignment =
      (currentUserId == sender) ? Alignment.centerRight : Alignment.centerLeft;

  final color = (currentUserId == sender)
      ? Theme.of(context).colorScheme.primary
      : Theme.of(context).colorScheme.secondary;

  final textColor = (currentUserId == sender)
      ? Theme.of(context).colorScheme.onPrimary
      : Theme.of(context).colorScheme.onSecondary;

  return Align(
    alignment: alignment,
    child: Container(
      constraints: BoxConstraints(maxWidth: size.width * 0.66),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          8.0,
        ),
      ),
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: textColor,
              fontSize: 16.0,
            ),
      ),
    ),
  );
}