import 'package:get/get.dart';
import 'package:loocal_database/db/db_helper.dart';
import 'package:loocal_database/models/note.dart';
import 'package:loocal_database/modules/view/CreateView.dart';
import 'package:loocal_database/modules/view/editView.dart';
import 'package:sqflite/sqflite.dart';

class HomePageController extends GetxController {
  Database db = DbHelper.getDb();

  RxBool isLoading = false.obs;
  late List<Note> notes;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  void getNotes() async {
    isLoading.value = true;
    List<Map<String, dynamic>> mapNotes = await db.query("Notes");
    notes = mapNotes.map((e) => Note.fromMap(map: e)).toList();
    isLoading.value = false;
  }

  void createNote() async {
    var newNotes = await Get.to(Edit());
    newNotes = newNotes as Note?;
    if (newNotes != null) {
      await db.insert("Notes", newNotes.toMap());
      getNotes();
    }
  }

  void deleteNotes(int id) async {
    db.delete("Notes", where: "id = ?", whereArgs: [id]);
    getNotes();
  }

  void updateNote(Note note) async {
    var newNote = await Get.to(
        Create(
          note: Note(title: note.title, content: note.content, id: note.id),
        ),
        arguments: Note(title: note.title, content: note.content, id: note.id));

    newNote = newNote as Note?;

    if (newNote != null) {
      await db.update("Notes", newNote.toMap(),
          where: "id = ?", whereArgs: [newNote.id]);
      getNotes();
    }
  }
}
