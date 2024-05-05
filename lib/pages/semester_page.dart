import 'package:flutter/material.dart';
import 'package:gpa_calculator/pages/add_result_dialog.dart';
import 'package:gpa_calculator/pages/results_tile.dart';
import 'package:gpa_calculator/util/semester.dart';
import 'package:gpa_calculator/util/semester_card.dart';
import 'package:gpa_calculator/util/semesters_model.dart';

class SemesterPage extends StatefulWidget {
  final Semester semester;
  final SemestersModel semestersModel;

  SemesterPage(
      {super.key, required this.semester, required this.semestersModel});

  @override
  State<SemesterPage> createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  void checkboxchanged(bool? value, int index) {
    setState(() {
      widget.semester.results[index].addToGpa =
          !widget.semester.results[index].addToGpa;
      widget.semestersModel.updateSemesterGPA(widget.semester);
    });
  }

  void addNewResult() {
    showDialog(
      context: context,
      builder: (context) {
        return AddResultDialog(
          // function to invoke when new result added
          onResultAdded: (result) {
            setState(() {
              widget.semestersModel.updateSemester(widget.semester, result);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //  var semester_gpa = Calculate_GPA.getGpa(results); //get gpa of the semester
    //  widget.semester.setResults();

    return Scaffold(
        appBar: AppBar(
          title: Text("Samindika"),
          backgroundColor: Colors.greenAccent,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addNewResult,
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            SemesterCard(semester: widget.semester),
            Expanded(
              child: SizedBox(
                child: widget.semester.results.isEmpty
                    ? Center(
                        child: Text('No results available'),
                      )
                    : ListView.builder(
                        itemCount: widget.semester.results.length,
                        itemBuilder: (context, index) {
                          return ResultTile(
                            result: widget.semester.results[index],
                            onChanged: (value) => checkboxchanged(value, index),
                          );
                        },
                      ),
              ),
            )
          ],
        ));
  }
}
