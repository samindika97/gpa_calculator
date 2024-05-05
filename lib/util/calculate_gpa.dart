import 'package:gpa_calculator/util/results.dart';
import 'package:gpa_calculator/util/semesters_model.dart';

class Calculate_GPA {
  static var grade_points = {
    'A+': 4.0,
    'A': 4.0,
    'A-': 3.7,
    'B+': 3.3,
    'B': 3.0,
    'B-': 2.7,
    'C+': 2.3,
    'C': 2.0,
    'C-': 1.7,
    'D+': 1.3,
    'D': 1.0,
    'E': 0,
  };

  static double getGpa(List<Result> results) {
    double totalQualityPoints = 0;
    int totalCreditHours = 0;

    for (var result in results) {
      if (result.addToGpa) {
        totalQualityPoints += grade_points[result.grade]! * result.creditHours;
        totalCreditHours += result.creditHours;
      }
    }
    if (totalCreditHours == 0) {
      return 0; // Avoid division by zero
    }

    print(totalCreditHours);
    print(totalQualityPoints);

    return totalQualityPoints / totalCreditHours;
  }

  static double calculateOverallGpa(SemestersModel semestersModel) {
    double totalWeightedGPA = 0;
    int totalCreditHours = 0;
    for (var semester in semestersModel.semesterslist) {
      double weightedGPA = semester.semesterGpa * semester.totalCreditHours;

      totalWeightedGPA += weightedGPA;
      totalCreditHours += semester.totalCreditHours;
    }
    double overallGPA = totalWeightedGPA / totalCreditHours;
    return overallGPA;
  }
}
