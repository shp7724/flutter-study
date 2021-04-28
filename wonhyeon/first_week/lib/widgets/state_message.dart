import 'package:flutter/material.dart';

class StateMessage extends StatelessWidget {
  final List<String> stateMessages = [
    'Press the numbers in increasing order',
    'Wrong Password! Try it again!!',
    'Correct Password! Unlock succeed!',
  ];
  final int stateMessageIndex;

  StateMessage(this.stateMessageIndex);

  @override
  Widget build(BuildContext context) {
    return Text(
      stateMessages[stateMessageIndex],
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
