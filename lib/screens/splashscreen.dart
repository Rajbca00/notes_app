import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

import '../main.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new Routes(),
      title: new Text(
        'Simply Notes',
        textScaleFactor: 1.5,
      ),
      image: new Image.asset('assets/images/logo.png'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Color(0xFF86bb6e),
    );
  }
}
