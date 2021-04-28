import 'package:flutter/cupertino.dart';

class PasswordDisplay extends StatelessWidget {
  final String passwordString;

  PasswordDisplay(this.passwordString);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(passwordString),
    );
  }
}
