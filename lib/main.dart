import 'package:flutter/material.dart';
import 'package:gpa_calculator/pages/semester_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.deepOrangeAccent,
          primarySwatch: Colors.purple,
        ),
        home: semester());
  }
}
