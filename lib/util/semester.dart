import 'package:gpa_calculator/util/results.dart';

class Semester {
  int level;
  int semesterNumber;
  late double semesterGpa;
  late List<Result> results = [];

  Semester({
    required this.level,
    required this.semesterNumber,
    double semesterGpa = 0.0,

  })  : semesterGpa = semesterGpa ;

  void setSemester_gpa(double gpa) {
    this.semesterGpa = gpa;
  }

  void setResults(Result result) {
    this.results.add(result);
  }
}
