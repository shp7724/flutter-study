import 'package:flutter/material.dart';
import './button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _unlocked = false;
  var _status = const [
    '오름차순으로 번호를 입력하세요',
    '잠금 해제됨',
    '다시 시도하세요.'
  ];
  String _pressedNumbers = "";
  List<int> _numbersList = [
    4, 5, 1, 7, 9, 2, 6, 3, 8
  ];

  void _pressButton(int value) {
    setState(() {
      _pressedNumbers += value.toString();
    });

    if(_pressedNumbers.length == 9)
      if(_pressedNumbers == "123456789") _unlocked = true;
      else _pressedNumbers = "";
    print(_pressedNumbers);
  }

  bool _isValuePressed(int value){
    List<String> pressedNumbers = _pressedNumbers.split("");
    return pressedNumbers.contains(value.toString()) ? true : false;
  }

  List<Widget> _getButtons(){
    List<Widget> buttons = [];
    for(int value in _numbersList){
      buttons.add(
          new Button(
              pressHandler : () => _pressButton(value),
              value : value,
              isPressed: _isValuePressed(value)
          )
      );
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('암호를 입력하세요.'),
         ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _unlocked ? Text(_status[1]) : Text(_status[0]),
                Text(_pressedNumbers),

                GridView.count(
                  shrinkWrap: true,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 3,
                  children: _getButtons(),
                )
              ],
            ),
          ),
      ),
    );
  }
}
