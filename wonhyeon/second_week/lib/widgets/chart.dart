import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';
import '../models/grade_info.dart';

class Chart extends StatelessWidget {
  final List<GradeInfo> takenClasses;
  final _gradeConvertTable = {
    'A+': 4.3,
    'A0': 4.0,
    'A-': 3.7,
    'B+': 3.3,
    'B0': 3.0,
    'B-': 2.7,
    'C+': 2.3,
    'C0': 2.0,
    'C-': 1.7,
    'D+': 1.3,
    'D0': 1.0,
    'D-': 0.7,
    'F': 0.0,
  };

  Chart(this.takenClasses);

  // Summer, Winter semesters are not considered.
  List<Map<String, Object>> get groupedSemeterGrades {
    return List.generate(10, (index) {
      final String semester = (index + 1).toString();
      double weightedGradeSum = 0.0;
      int creditSum = 0;

      for (int i = 0; i < takenClasses.length; i++) {
        if (takenClasses[i].semester == semester) {
          weightedGradeSum += takenClasses[i].credit *
              _gradeConvertTable[takenClasses[i].letterGrade];
          creditSum += takenClasses[i].credit;
        }
      }

      return {
        'semester': semester,
        'semesterGpa': creditSum == 0 ? 0.0 : weightedGradeSum / creditSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedSemeterGrades.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                semester: data['semester'],
                semesterGpa: data['semesterGpa'],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
