import 'package:flutter/material.dart';
import 'package:gpa_calculator/pages/add_result_dialog.dart';
import 'package:gpa_calculator/pages/results_tile.dart';
import 'package:gpa_calculator/util/calculate_gpa.dart';
import 'package:gpa_calculator/util/semester.dart';
import 'package:gpa_calculator/util/semester_card.dart';
import 'package:gpa_calculator/util/semesters_model.dart';

class Semester_page extends StatefulWidget {
  final Semester semester;
  final SemestersModel semestersModel;

  Semester_page(
      {super.key, required this.semester, required this.semestersModel});

  @override
  State<Semester_page> createState() => _Semester_pageState();
}

class _Semester_pageState extends State<Semester_page> {
  void checkboxchanged(bool? value, int index) {
    setState(() {
      widget.semester.results[index].addToGpa =
          !widget.semester.results[index].addToGpa;
      widget.semester
          .setSemester_gpa(Calculate_GPA.getGpa(widget.semester.results));
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
              widget.semestersModel.updateSemester(
                  widget.semestersModel.semesters_list.indexOf(widget.semester),
                  result);
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
