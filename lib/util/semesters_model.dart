import 'package:flutter/material.dart';
import 'package:gpa_calculator/util/results.dart';
import 'package:gpa_calculator/util/semester.dart';

class SemestersModel with ChangeNotifier{
  List<Semester> semesters_list = [];

  SemestersModel({
    required this.semesters_list,
  });

  void updateSemester(int index, Result result){
    semesters_list[index].setResults(result) ; 
    notifyListeners();
  }
}