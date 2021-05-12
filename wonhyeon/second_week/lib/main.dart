import 'package:flutter/material.dart';
import './models/grade_info.dart';
import './widgets/class_list.dart';
import './widgets/chart.dart';
import './widgets/new_class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA manager',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.black,
        accentColor: Colors.blue,
        errorColor: Colors.red,
        fontFamily: 'QuickSand',
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<GradeInfo> _takenClasses = [];

  void _addNewClass(String semester, String major_name, String class_name,
      String prof_name, int credit, String letterGrade) {
    final newClass = GradeInfo(
      semester: semester,
      major_name: major_name,
      class_name: class_name,
      prof_name: prof_name,
      credit: credit,
      letterGrade: letterGrade,
    );
    setState(() {
      _takenClasses.add(newClass);
    });
  }

  void _startAddNewClass(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewClass(_addNewClass),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteClass(String semester, String major_name, String class_name) {
    setState(() {
      _takenClasses.removeWhere((cl) {
        return (cl.semester == semester) &&
            (cl.major_name == major_name) &&
            (cl.class_name == class_name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('학점 계산기', style: TextStyle(fontFamily: 'OpenSans')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewClass(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_takenClasses),
            ClassList(_takenClasses, _deleteClass),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewClass(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
