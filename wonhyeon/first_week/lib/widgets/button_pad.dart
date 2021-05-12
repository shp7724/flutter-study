import '../models/number_buttons.dart';
import 'package:flutter/material.dart';

class ButtonPad extends StatelessWidget {
  final Function updateCtrl;
  final List<NumberButtons> buttons;

  ButtonPad(this.buttons, this.updateCtrl);

  @override
  Widget build(BuildContext context) {
    // Shuffle the button list to ensure the random order.
    buttons.shuffle();

    // returning button pad
    return GridView.count(
      shrinkWrap: true,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 20.0,
      crossAxisCount: 3,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      children: buttons.map((bt) {
        return MaterialButton(
          onPressed: () {
            updateCtrl(bt);
          },
          child: Text(bt.displayNum),
          color: bt.color,
          elevation: 5,
        );
      }).toList(),
    );
  }
}
