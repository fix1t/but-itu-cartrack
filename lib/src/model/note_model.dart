import 'package:firebase_database/firebase_database.dart';
import 'package:itu_cartrack/src/model/note.dart';

class NoteModel {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  NoteModel();

  Future<void> addNote(Note note, String carId) async {
    DatabaseReference noteRef = databaseReference.child('cars').child(carId).child('notes').push();
    await noteRef.set(note.toMap());
  }

  Future<void> deleteNote(String noteId, String carId) async {
    await databaseReference.child('cars').child(carId).child('notes').child(noteId).remove();
  }

  Stream<List<Note>> getNotes(String carId) {
    return databaseReference.child('cars').child(carId).child('notes').onValue.map((event) {
      var snapshot = event.snapshot;
      var data = snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        List<Note> notesList = [];
        data.forEach((key, value) {
          if (value is Map<Object?, Object?>) {
            notesList.add(Note.fromMap(key, value.cast<String, dynamic>()));
          }
        });

        notesList.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        print(notesList);
        return notesList;
      }

      return [];
    });
  }
}