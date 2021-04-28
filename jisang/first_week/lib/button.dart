import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function pressHandler;
  final int value;
  bool isPressed = false;

  Button({this.pressHandler, this.value, this.isPressed});

  @override
  Widget build(BuildContext context){
    return Container(
      width: 10.0,
      margin : EdgeInsets.all(5),
      child: RaisedButton(
        color : isPressed ? Colors.green : Colors.white,
        textColor: Colors.black,
        child: Text(value.toString()),
        onPressed: pressHandler,
      ),
    );
  }
}
