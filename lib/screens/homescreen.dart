import 'package:flutter/material.dart';
import 'package:simply_notes_ls/models/note.dart';
import 'package:simply_notes_ls/services/notes_storage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];

  void initState() {
    super.initState();
    _loadNotes();
  }

  void _loadNotes() async {
    var data = await NotesStorage().getNotes();
    setState(() {
      notes = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(notes);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notes',
        ),
      ),
      body: Center(child: Text('Hello World!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          _loadNotes();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
