import 'package:localstorage/localstorage.dart';
import 'package:simply_notes_ls/models/note.dart';

class NotesStorage {
  List<Note> _notes = [];
  final String key = 'notes';
  final LocalStorage storage = new LocalStorage('todo_app');

  Future<List<Note>> getNotes() async {
    await storage.ready;

    var value = storage.getItem(key);
    print('value');
    print(value);
    if (value != null) {
      _notes = List<Note>.from((value as List).map((note) => Note(
            title: note['title'],
            text: note['text'],
            lastModified: DateTime.parse(note['lastModified']),
          )));
    }

    return _notes;
  }

  Future<List<Note>> addNote(Note note) async {
    print('getting notes');
    _notes = await getNotes();
    print('notes loaded');
    print(_notes);
    _notes.add(note);
    _saveToStorage();

    return _notes;
  }

  Future<List<Note>> removeNote(Note note) async {
    _notes = await getNotes();
    _notes.removeWhere((item) =>
        item.title == note.title &&
        item.text == note.text &&
        item.lastModified == note.lastModified);
    _saveToStorage();

    return _notes;
  }

  void _saveToStorage() async {
    await storage.setItem(
        key, _notes.map((note) => note.toJSONEncodable()).toList());
  }
}
