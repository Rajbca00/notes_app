import 'package:flutter/material.dart';
import 'package:simply_notes_ls/screens/addnotescreen.dart';
import 'package:simply_notes_ls/screens/editnotescreen.dart';
import 'package:simply_notes_ls/screens/homescreen.dart';
import 'package:simply_notes_ls/screens/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySplashScreen(),
    );
  }
}

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/edit': (context) => EditNoteScreen(),
        '/add': (context) => AddNoteScreen()
      },
    );
  }
}
