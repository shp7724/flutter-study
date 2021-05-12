import 'package:flutter/material.dart';
import '../models/grade_info.dart';

class ClassList extends StatelessWidget {
  final List<GradeInfo> takenClasses;
  final Function deleteClass;

  ClassList(this.takenClasses, this.deleteClass);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: takenClasses.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No classes added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('${takenClasses[index].letterGrade}'),
                        ),
                      ),
                    ),
                    title: Text(
                      '${takenClasses[index].semester} / ${takenClasses[index].class_name} / ${takenClasses[index].prof_name}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      '${takenClasses[index].major_name} / ${takenClasses[index].credit.toString()}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteClass(
                          takenClasses[index].semester,
                          takenClasses[index].major_name,
                          takenClasses[index].class_name),
                    ),
                  ),
                );
              },
              itemCount: takenClasses.length,
            ),
    );
  }
}
