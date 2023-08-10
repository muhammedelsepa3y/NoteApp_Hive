import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/note.dart';

class Notes with ChangeNotifier{

  final Box _myBox = Hive.box<Note>('notes');
  final List<Note> items = [];

  void addNote({
    required String title,
    required String description,
  }){
    final id = DateTime.now().toString();
    final note = Note(
      id: id,
      title: title,
      description: description,
      date: DateTime.now(),
      isFavorite: false,
      isImportant: false,
    );
    _myBox.add(note);
    notifyListeners();
  }

  void fetchNotes(){
    items.clear();
    for (int i = 0; i < _myBox.length; i++) {
      items.add(_myBox.getAt(i)!);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void deleteNoteById(int id){
    items.removeAt(id);
    _myBox.deleteAt(id);
    notifyListeners();
  }

  void toggleIsFavorite(int id){
    items[id].isFavorite = !items[id].isFavorite;
    _myBox.putAt(id, items[id]);
    notifyListeners();
  }



}