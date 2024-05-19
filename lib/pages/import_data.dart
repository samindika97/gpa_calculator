import "dart:io";
import "package:flutter/material.dart";
import "package:file_picker/file_picker.dart";
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

    final usersemesterlist = document
        .querySelectorAll(
            'td[colspan="8"][style="font-weight: bold; font-size: larger;"]')
        .map((e) => e.innerHtml)
        .toList();

    int numOfSemesters = usersemesterlist.length;

    final regExp = RegExp(r'Semester:\s(\d{4}/\d{4})\s-\s(\d)');

    final match = regExp.firstMatch(usersemesterlist[0]);

    setState(() {

      widget.semestersModel.updateSemesterlevel(
          widget.semestersModel.semesterslist[0], "text");

      print(widget.semestersModel.semesterslist[0].level);
    });
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
