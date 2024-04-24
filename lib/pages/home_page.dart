import 'package:flutter/material.dart';
import 'package:gpa_calculator/pages/semester_page.dart';
import 'package:gpa_calculator/util/semester_card.dart';
import 'package:gpa_calculator/util/semesters_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final SemestersModel semestersModel = Provider.of<SemestersModel>(context);
    //semesters[0].setResults();
    return Scaffold(
      body: ListView.builder(
          itemCount: semestersModel.semesters_list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Semester_page(
                        semester: semestersModel.semesters_list[index],
                        semestersModel: semestersModel,
                      ), // Pass the selected semester to SemesterPage
                    ));
              },
              child: SemesterCard(
                  semester: semestersModel.semesters_list[index]),
            );
          }),
    );
  }
}
