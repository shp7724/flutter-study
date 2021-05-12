import 'package:flutter/material.dart';
import '../models/grade_info.dart';

class NewClass extends StatefulWidget {
  final Function addClass;

  NewClass(this.addClass);

  @override
  _NewClassState createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  final _semesterController = TextEditingController();
  final _majorNameController = TextEditingController();
  final _classNameController = TextEditingController();
  final _profNameController = TextEditingController();
  final _creditController = TextEditingController();
  final _letterGradeController = TextEditingController();

  void _submitData() {
    if (_creditController.text.isEmpty) {
      return;
    }

    final enteredSemester = _semesterController.text;
    final enteredMajor = _majorNameController.text;
    final enteredClass = _classNameController.text;
    final enteredProf = _profNameController.text;
    final enteredCredit = int.parse(_creditController.text);
    final enteredLetterGrade = _letterGradeController.text;

    if (enteredSemester.isEmpty ||
        enteredMajor.isEmpty ||
        enteredClass.isEmpty ||
        enteredProf.isEmpty ||
        enteredLetterGrade.isEmpty) {
      return;
    }

    widget.addClass(
      enteredSemester,
      enteredMajor,
      enteredClass,
      enteredProf,
      enteredCredit,
      enteredLetterGrade,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: '학기 (1~10의 정수로 입력해주세요)'),
                controller: _semesterController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: '전공명'),
                controller: _majorNameController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: '수업명'),
                controller: _classNameController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: '교수명'),
                controller: _profNameController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: '학점 (1~4의 정수로 입력해주세요)'),
                controller: _creditController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: '평점 (Letter grade로 입력해주세요)'),
                controller: _letterGradeController,
                onSubmitted: (_) => _submitData(),
              ),
              RaisedButton(
                onPressed: _submitData,
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).primaryColor,
                child: Text('성적입력'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
