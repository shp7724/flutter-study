import 'package:assignment1/my_button.dart';
import 'package:flutter/material.dart';

class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final List<String> _pressedButtons = [];

  final List<List<String>> myButtonsText = [
    ['1', '8', '4'],
    ['7', '3', '5'],
    ['6', '2', '9']
  ];

  bool unlocked = false;

  void unlock() {
    setState(() {
      unlocked = true;
    });
  }

  void changePressedButton(bool pressed, String text) {
    setState(() {
      if (pressed) {
        _pressedButtons.add(text);
      } else {
        _pressedButtons.remove(text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Column(
            children: [
              Text(unlocked ? '잠금 해제됨' : '오름차순으로 번호를 입력하세요.'),
              SizedBox(
                height: 10,
              ),
              Text(
                _pressedButtons.join(""),
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          padding: EdgeInsets.all(20),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: myButtonsText.map(
              (texts) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: texts
                      .map((text) => MyButton(
                          text, _pressedButtons, changePressedButton, unlock))
                      .toList(),
                );
              },
            ).toList())
      ],
    );
  }
}
