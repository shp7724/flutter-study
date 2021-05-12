import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewGrade extends StatefulWidget {
  final Function addGrade;

  NewGrade(this.addGrade);

  @override
  _NewGradeState createState() => _NewGradeState();
}

class _NewGradeState extends State<NewGrade> {
  final _semesterController = TextEditingController();
  final _majorController = TextEditingController();
  final _titleController = TextEditingController();
  final _professorController = TextEditingController();
  final _creditController = TextEditingController();
  final _gradeController = TextEditingController();

  void _submitData() {
    if (_gradeController.text.isEmpty) {
      return;
    }
    final enteredSemester = int.parse(_semesterController.text);
    final enteredMajor = _majorController.text;
    final enteredTitle = _titleController.text;
    final enteredProfessor = _professorController.text;
    final enteredCredit = int.parse(_creditController.text);
    final enteredGrade = _gradeController.text;

    if (enteredSemester.isNegative || enteredCredit.isNegative) return;
    if (enteredMajor.isEmpty || enteredTitle.isEmpty || enteredProfessor.isEmpty || enteredGrade.isEmpty )
      return;

    widget.addGrade(
      enteredSemester,
      enteredMajor,
      enteredTitle,
      enteredProfessor,
      enteredCredit,
      enteredGrade,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Wrap(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Semester'),
              controller: _semesterController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Major'),
              controller: _majorController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Professor'),
              controller: _professorController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Credit'),
              controller: _creditController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Grade'),
              controller: _gradeController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            RaisedButton(
              child: Text('Add Grade'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
