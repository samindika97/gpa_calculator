import 'package:flutter/material.dart';
import 'package:gpa_calculator/util/calculate_gpa.dart';
import 'package:gpa_calculator/util/semesters_model.dart';

class OverallCard extends StatelessWidget {
  final SemestersModel semestersmodel;

  const OverallCard({super.key, required this.semestersmodel});

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
            'Your Current GPA ${Calculate_GPA.calculateOverallGpa(semestersmodel)}', // Replace with your overall result data
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            'Your total credit ${Calculate_GPA.getTotalCredit(semestersmodel)}', // Replace with your total credit data
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
}