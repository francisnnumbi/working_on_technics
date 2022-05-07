import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'note.dart';

class NotesController extends GetxController {
  var notes = <Note>[].obs;

  addNote(Note note) {
    //log(note.toString());
    List<dynamic> _notes = jsonDecode(GetStorage().read("notes"));
    _notes.add(note.toMap());
    GetStorage().write("notes", jsonEncode(_notes));
  }

  void removeNote(int index) {
    List<dynamic> _notes = jsonDecode(GetStorage().read("notes"));
    _notes.removeAt(index);
    GetStorage().write("notes", jsonEncode(_notes));
  }

  @override
  void onReady() {
    GetStorage().writeIfNull("notes", jsonEncode(notes.value));
    List<dynamic> ll = jsonDecode(GetStorage().read("notes"));
    notes.value = ll.map((note) => Note.fromMap(note)).toList();

    super.onReady();
    GetStorage().listenKey("notes", (value) {
      List<dynamic> _notes = jsonDecode(value);

      notes.value = _notes.map((note) => Note.fromMap(note)).toList();
    });
  }
}
