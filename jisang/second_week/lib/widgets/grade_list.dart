import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/grade.dart';

class GradeList extends StatelessWidget {
  final List<Grade> grades;
  final Function deleteGrade;

  GradeList(this.grades, this.deleteGrade);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: grades.isEmpty
          ? Column(
        children: <Widget>[
          Text(
            'No grades added yet!',
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 200,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              )),
        ],
      )
          : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('${grades[index].grade}'),
                  ),
                ),
              ),
              title: Row(
               children: <Widget>[
                 Text(grades[index].semester.toString() + "번째 학기"),
                 Text(grades[index].title),
                 Text(grades[index].professor + "교수"),
               ]
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(grades[index].major + "전공"),
                  Text(grades[index].credit.toString() + "학점"),
                ]
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteGrade(grades[index].title),
              ),
            ),
          );
        },
        itemCount: grades.length,
      ),
    );
  }
}
