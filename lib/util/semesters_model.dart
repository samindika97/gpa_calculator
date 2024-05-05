import 'package:flutter/material.dart';
import 'package:gpa_calculator/util/calculate_gpa.dart';
import 'package:gpa_calculator/util/results.dart';
import 'package:gpa_calculator/util/semester.dart';

class SemestersModel with ChangeNotifier {
  List<Semester> semesterslist = [
    Semester(level: 1000, semesterNumber: 1),
    Semester(level: 1000, semesterNumber: 2),
    Semester(level: 2000, semesterNumber: 1),
    Semester(level: 2000, semesterNumber: 2),
    Semester(level: 3000, semesterNumber: 1),
    Semester(level: 3000, semesterNumber: 2),
    Semester(level: 4000, semesterNumber: 1),
    Semester(level: 4000, semesterNumber: 2),
  ];

  SemestersModel();

  double getGpa(int index){
    return semesterslist[index].semesterGpa ;
  }

  void updateSemester(Semester semester, Result result) {
    semester.setResults(result);
    notifyListeners();
  }

  void updateSemesterGPA(Semester semester){
    semester.updateGpaAndCredit() ;
    notifyListeners();
  }
}
