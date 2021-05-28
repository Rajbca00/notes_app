import 'package:flutter/material.dart';
import 'package:simply_notes_ls/models/note.dart';
import 'package:simply_notes_ls/services/notes_storage.dart';
// import 'package:simply_notes_ls/widgets/my_text_field.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: 'Title',
                      border: UnderlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLines: 10,
                  controller: textController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: 'Enter your notes..',
                      border: UnderlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      NotesStorage().addNote(Note(
                          title: titleController.text,
                          text: textController.text,
                          lastModified: DateTime.now()));
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
                    style: ButtonStyle(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
