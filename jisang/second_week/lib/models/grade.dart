import 'package:flutter/foundation.dart';

class Grade {
  final int semester;
  final String major;
  final String title;
  final String professor;
  final int credit;
  final String grade;

  Grade({
    @required this.semester,
    @required this.major,
    @required this.title,
    @required this.professor,
    @required this.credit,
    @required this.grade
  });
}

