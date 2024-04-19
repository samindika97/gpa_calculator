import 'package:flutter/material.dart';
import 'package:gpa_calculator/pages/semester_page.dart';
import 'package:gpa_calculator/util/semester_card.dart';

import '../util/results.dart';
import '../util/semester.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<Semester> semesters = [
  Semester(level: 1000, semesterNumber: 1),
  Semester(level: 1000, semesterNumber: 2),
  Semester(level: 2000, semesterNumber: 1),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   //semesters[0].setResults();
    return Scaffold(
      body: ListView.builder(
          itemCount: semesters.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Semester_page(semester: semesters[index]), // Pass the selected semester to SemesterPage
                ));
              },
              child: SemesterCard(semester: semesters[index]),
            );
          }),
    );
  }
}
