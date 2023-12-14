import 'package:flutter/material.dart';

class CarNotesScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index]),
                );
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

List<String> notes = [
  'Note Message 1',
  'Note Message 2',
  'Note Message 3',
  'Note Message 4',
  'Note Message 5',
  'Note Message 6',
  'Note Message 7',
  'Note Message 8',
  'Note Message 9',
  // Add more notes here
];
