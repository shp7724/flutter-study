import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text;
  final List<String> pressedButtons;
  final Function changePressedButton;
  final Function unlock;

  MyButton(this.text, this.pressedButtons, this.changePressedButton, this.unlock);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _pressed = false;

  void unlockIfCorrect() {
    if (widget.pressedButtons.length < 9) {
      return;
    }
    if (widget.pressedButtons.join("") == '123456789') {
      widget.unlock();
    }
  }

  void onPressed() {
    setState(() {
      _pressed = !_pressed;
      widget.changePressedButton(_pressed, widget.text);
      unlockIfCorrect();
    });

  }

  @override
  Widget build(BuildContext context) {
    print(widget.pressedButtons);
    return RaisedButton(
      color: _pressed ? Colors.green : Colors.white,
      child: Text(widget.text),
      onPressed: onPressed,
    );
  }
}
