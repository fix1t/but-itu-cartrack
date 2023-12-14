import 'dart:developer';

import 'package:itu_cartrack/src/model/note_model.dart';
import 'package:itu_cartrack/src/model/note.dart';
import 'package:itu_cartrack/src/controller/car_controller.dart';
import 'package:itu_cartrack/src/model/car.dart';


class NoteController {
  static final NoteController _instance = NoteController._internal();

  factory NoteController() {
    return _instance;
  }

  NoteController._internal();

  final NoteModel noteModel = NoteModel();

  Stream<List<Note>> getNotes(String activeCarId) => noteModel.getNotes(activeCarId);

  Future<void> addNote(Note note, String activeCarId) async {
    await noteModel.addNote(note, activeCarId);
  }

  Future<void> deleteNote(String noteId, String activeCarId) async {
    await noteModel.deleteNote(noteId, activeCarId);
    noteModel.getNotes(activeCarId);
  }
}