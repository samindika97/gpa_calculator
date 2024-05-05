import 'package:gpa_calculator/util/calculate_gpa.dart';
import 'package:gpa_calculator/util/results.dart';

class Semester {
  int level;
  int semesterNumber;
  late int totalCreditHours;
  late double semesterGpa;
  late List<Result> results = [];

  Semester({
    required this.level,
    required this.semesterNumber,
    double semesterGpa = 0.0,
  }) : semesterGpa = semesterGpa;

  void updateGpaAndCredit() {
    semesterGpa = Calculate_GPA.getGpa(results);
    totalCreditHours = 0 ;
    for (var result in results) {
      if (result.addToGpa) {
        totalCreditHours += result.creditHours;
      }
    }
  }

  void setResults(Result result) {
    results.add(result);
    updateGpaAndCredit();
    if (result.addToGpa) {
      totalCreditHours += result.creditHours;
    }
  }
}
