import '../models/number_buttons.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ButtonPad extends StatelessWidget {
  final Function updateCtrl;
  final List<NumberButtons> buttons;

  ButtonPad(this.buttons, this.updateCtrl);

  @override
  Widget build(BuildContext context) {
    // Shuffle the button list to ensure the random order.
    buttons.shuffle();

    // returning widget
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttons.sublist(0, 3).map((bt) {
            return Container(
              child: MaterialButton(
                onPressed: () {
                  updateCtrl(bt);
                },
                child: Text(bt.displayNum),
                color: bt.color,
                elevation: 5,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 10,
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttons.sublist(3, 6).map((bt) {
            return Container(
              child: MaterialButton(
                onPressed: () {
                  updateCtrl(bt);
                },
                child: Text(bt.displayNum),
                color: bt.color,
                elevation: 5,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 10,
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttons.sublist(6, 9).map((bt) {
            return Container(
              child: MaterialButton(
                onPressed: () {
                  updateCtrl(bt);
                },
                child: Text(bt.displayNum),
                color: bt.color,
                elevation: 5,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 10,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
