import 'package:flutter/material.dart';
import 'package:gpa_calculator/pages/home_page.dart';
import 'package:gpa_calculator/util/semester.dart';
import 'package:gpa_calculator/util/semesters_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SemestersModel(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.deepOrangeAccent,
          primarySwatch: Colors.purple,
        ),
        home:  HomePage(),
      ),
    );
  }
}
