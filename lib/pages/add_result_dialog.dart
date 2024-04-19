import 'package:flutter/material.dart';
import 'package:gpa_calculator/util/results.dart';

class AddResultDialog extends StatefulWidget {
  final Function(Result result)? onResultAdded;

  const AddResultDialog({Key? key, this.onResultAdded}) : super(key: key);

  @override
  _AddResultDialogState createState() => _AddResultDialogState();
}

class _AddResultDialogState extends State<AddResultDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _courseNameController;
  late String _selectedGrade;
  late TextEditingController _creditHoursController;

  @override
  void initState() {
    super.initState();
    _courseNameController = TextEditingController();
    _selectedGrade = 'A';
    _creditHoursController = TextEditingController();
  }

  @override
  void dispose() {
    _courseNameController.dispose();
    _creditHoursController.dispose();
    super.dispose();
  }

  var result_ranges = ['A+', 'A', 'B+', 'B', 'B-', 'C+', 'C', 'C-','D+','D','E'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Result'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _courseNameController,
                decoration: InputDecoration(labelText: 'Course Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a course name';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedGrade,
                items: result_ranges.map((grade) {
                  return DropdownMenuItem<String>(
                    value: grade,
                    child: Text(grade),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGrade = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Grade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a grade';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _creditHoursController,
                decoration: InputDecoration(labelText: 'Credit Hours'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter credit hours';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid numeric value';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final courseName = _courseNameController.text;
              final grade = _selectedGrade;
              final creditHours = int.parse(_creditHoursController.text);

              final result = Result(
                courseName: courseName,
                grade: grade,
                creditHours: creditHours,
                addToGpa:
                    true, // You can set this to whatever default value you want
              );

              if (widget.onResultAdded != null) {
                widget.onResultAdded!(result);
              }

              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
