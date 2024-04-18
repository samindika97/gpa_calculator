import 'package:flutter/material.dart';
import 'package:gpa_calculator/util/results.dart';

class ResultTile extends StatelessWidget {
  final Result result;
  final Function(bool?)? onChanged;

  const ResultTile({Key? key, required this.result, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 25.0, left: 25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.yellow[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
              value: result.addToGpa,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    result.courseName,
                    style: TextStyle(
                      decoration: result.addToGpa
                          ? TextDecoration.none
                          : TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    'Credits: ${result.creditHours}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Grade: ${result.grade}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
