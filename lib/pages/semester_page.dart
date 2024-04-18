import 'package:flutter/material.dart';
import 'package:gpa_calculator/pages/add_result_dialog.dart';
import 'package:gpa_calculator/pages/results_tile.dart';
import 'package:gpa_calculator/util/calculate_gpa.dart';
import 'package:gpa_calculator/util/results.dart';

class semester extends StatefulWidget {
  const semester({super.key});

  @override
  State<semester> createState() => _semesterState();
}

List<Result> results = [
  Result(courseName: 'Math', grade: 'A', creditHours: 3, addToGpa: false),
  Result(courseName: 'English', grade: 'B', creditHours: 4, addToGpa: true),
  Result(courseName: 'History', grade: 'B', creditHours: 3, addToGpa: true),
  Result(courseName: 'Science', grade: 'B', creditHours: 3, addToGpa: true),
  Result(courseName: 'Computer Science', grade: 'B', creditHours: 4, addToGpa: true),
  Result(courseName: 'Art', grade: 'B-', creditHours: 3, addToGpa: true),
  Result(courseName: 'Geography', grade: 'B', creditHours: 3, addToGpa: true),
  Result(courseName: 'Physics', grade: 'B', creditHours: 5, addToGpa: true),
  Result(courseName: 'Chemistry', grade: 'B-', creditHours: 13, addToGpa: false),
];

var gpa = Calculate_GPA.getGpa(results) ;

class _semesterState extends State<semester> {
  void checkboxchanged(bool? value, int index) {
    setState(() {
      results[index].addToGpa = !results[index].addToGpa ;
    });
  }

void addNewResult(){
  showDialog(
  context: context,
  builder: (context) {
    return AddResultDialog(
      //function to invoke when new result added
      onResultAdded: (result) {
        setState(() {
          results.add(result);
        });
      },
    );
  },
);

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(gpa.toString()),
          backgroundColor: Colors.greenAccent,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: addNewResult,
        child: Icon(Icons.add),
      ),
        body: ListView.builder(
            itemCount: results.length, itemBuilder: (contex, index) {
              return ResultTile(result: results[index], onChanged: (value) => checkboxchanged(value, index));
            }));
  }
}
