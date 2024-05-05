import 'package:flutter/material.dart';
import 'package:gpa_calculator/pages/semester_page.dart';
import 'package:gpa_calculator/util/overallcard.dart';
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

    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(8.0),
            child: OverallCard(semestermodel: semestersModel,),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              mainAxisExtent: 140,
            ),
            itemCount: semestersModel.semesterslist.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SemesterPage(
                        semester: semestersModel.semesterslist[index],
                        semestersModel: semestersModel,
                      ),
                    ),
                  );
                },
                child: SemesterCard(
                  semester: semestersModel.semesterslist[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}