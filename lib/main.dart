
import 'package:apilearning/loginsignup.dart';
import 'package:apilearning/photo_screen.dart';
import 'package:apilearning/todo_screen.dart';
import 'package:apilearning/user_screen.dart';
import 'package:flutter/material.dart';

import 'image_upload.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadImageScreen() ,

    );
  }
}
