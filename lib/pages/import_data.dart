import "dart:io";
import "package:flutter/material.dart";
import "package:file_picker/file_picker.dart";
import "package:gpa_calculator/util/results.dart";
import "package:gpa_calculator/util/semesters_model.dart";
import 'package:html/parser.dart' as parser;

class ImportData extends StatefulWidget {
  final SemestersModel semestersModel;

  const ImportData({super.key, required this.semestersModel});

  @override
  State<ImportData> createState() => _ImportDataState();
}

class _ImportDataState extends State<ImportData> {
  void _parseData(String contentString) {
    // Parse the HTML content
    final document = parser.parse(contentString);
    final resultTable = document.querySelector('table');

    if (resultTable != null) {
      List tableRows = resultTable.querySelectorAll("tr");

      int semesterCount = -1;
      tableRows.forEach((row) {
        List cells = row.querySelectorAll('td');
        if (cells.length == 1) {
          semesterCount++;
        } else if (cells.length == 5) {
          var courseName = cells[1].text.trim();
          var grade = cells[4].text.trim();
          var creditHoursText = cells[3].text.trim();
          var creditHours = 0;
          try {
            creditHours = int.parse(creditHoursText);
          } catch (e) {
            print('Error parsing credits: $e');
            return;
          }

          if (grade != '') {
            var newResult = Result(
                courseName: courseName,
                grade: grade,
                creditHours: creditHours,
                addToGpa: true);
            widget.semestersModel.updateSemester(
                widget.semestersModel.semesterslist[semesterCount], newResult);
          }
        }
      });
    }
  }

  void _pickfile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['html'], // Only allow HTML files
    );
    // if no file is picked
    if (result == null) return;

    final fileContent = result.files.first.bytes;

    if (fileContent != null) {
      final contentString = String.fromCharCodes(fileContent);
      _parseData(contentString);
    } else {
      print("File error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Import Data"),
      ),
      body: MaterialButton(
        onPressed: () {
          _pickfile();
        },
        color: Colors.green,
        child: Text(
          'Pick and open file',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
