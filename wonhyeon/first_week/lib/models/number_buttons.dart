import 'package:flutter/material.dart';

class NumberButtons {
  final String displayNum; // A number to be displayed
  final int value; // The actual value. Same as the 'displayNum'
  Color color;

  NumberButtons({this.value, this.color}) : displayNum = value.toString();
}
