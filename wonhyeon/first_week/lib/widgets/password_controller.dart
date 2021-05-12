import 'package:flutter/material.dart';
import '../models/number_buttons.dart';
import './button_pad.dart';
import './password_display.dart';
import './state_message.dart';

class PasswordController extends StatefulWidget {
  @override
  _PasswordControllerState createState() => _PasswordControllerState();
}

class _PasswordControllerState extends State<PasswordController> {
  String _passwordString = '';
  int _passwordChecker = 1;
  int _stateMessageIndex = 0;
  final _buttons = [
    for (int i = 1; i < 10; i++)
      new NumberButtons(
        value: i,
        color: Colors.white,
      )
  ];

  void _initializeController() {
    _passwordString = '';
    _passwordChecker = 1;
    _stateMessageIndex = 1; // Wrong Password
    for (int i = 0; i < 9; i++) _buttons[i].color = Colors.white;
  }

  void _updateController(NumberButtons bt) {
    final String addPassword = bt.value.toString();

    setState(() {
      if (_passwordChecker == bt.value) {
        _passwordString = '$_passwordString$addPassword';
        _passwordChecker++;
        bt.color = Colors.green;
        if (bt.value == 9) // Correct Password
          _stateMessageIndex = 2;
      } else
        _initializeController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        StateMessage(_stateMessageIndex),
        PasswordDisplay(_passwordString),
        ButtonPad(_buttons, _updateController),
      ],
    );
  }
}
