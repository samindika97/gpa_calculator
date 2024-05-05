import 'package:flutter/material.dart';
import 'package:gpa_calculator/util/semesters_model.dart';

class OverallCard extends StatelessWidget {
  final SemestersModel semestermodel;

  const OverallCard({super.key, required this.semestermodel});

@override
Widget build(BuildContext context) {
  return Center(
    child: Container(
      color: Colors.blue,
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Current GPA ${semestermodel}', // Replace with your overall result data
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            'Your total credit', // Replace with your total credit data
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
}