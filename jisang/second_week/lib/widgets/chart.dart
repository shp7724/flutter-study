import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/grade.dart';


class Chart extends StatelessWidget {
  final List<Grade> userGrades;

  var grades = <String, double>{
    "A+" : 4.3,
    "A0" : 4.0,
    "A-" : 3.7,
    "B+" : 3.3,
    "B0" : 3.0,
    "B-" : 2.7,
    "C+" : 2.3,
    "C0" : 2.0,
    "C-" : 1.7,
    "D+" : 1.3,
    "D0" : 1.0,
    "D-" : 0.7,
    "F"  : 0.0,
  };

  Chart(this.userGrades);

  List<Map<String, Object>> get groupedGradeValues {

    return List.generate(9, (index) {
      var totalSum = 0.0;
      var totalCredit = 0;

      for(var i = 0; i < userGrades.length; i++){
        if(index == 0){
          totalSum += grades[userGrades[i].grade] * userGrades[i].credit;
          totalCredit += userGrades[i].credit;
        } else if(userGrades[i].semester == index){
          totalSum += grades[userGrades[i].grade] * userGrades[i].credit;
          totalCredit += userGrades[i].credit;
        }
      }

      return {
        'semester': index,
        'averageGPA': totalCredit == 0 ? 0.0 : totalSum / totalCredit,
      };
    }).toList();
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
          children: groupedGradeValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['semester'],
                data['averageGPA'],
                (data['averageGPA'] as double) / 4.3,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
