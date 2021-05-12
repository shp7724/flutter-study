import 'package:flutter/material.dart';

class GradeInfo {
  final String semester;
  final String major_name;
  final String class_name;
  final String prof_name;
  final int credit;
  final String letterGrade;

  GradeInfo({
    @required this.semester,
    @required this.major_name,
    @required this.class_name,
    @required this.prof_name,
    @required this.credit,
    @required this.letterGrade,
  });
}
