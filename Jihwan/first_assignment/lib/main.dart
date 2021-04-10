import 'package:flutter/material.dart';
import './button.dart';
import './resultcheck.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {
  
  // List<Map> Buttons = [{'keypad': 8, 'pressed': false}, {'keypad' : 3, 'pressed' : false}, {'keypad' : 2, 'pressed' : false}, 
  // {'keypad': 1, 'pressed' : false}, {'keypad': 9, 'pressed' : false}, {'keypad': 6, 'pressed' : false},
  // {'keypad': 5, 'pressed' : false}, {'keypad': 4, 'pressed' : false}, {'keypad': 7, 'pressed' : false},];

  final List<int> KeyPadList = [8, 3, 2, 1, 9, 6, 5, 4, 7];
  List<bool> PressedTrueFalse = [false, false, false, false, false, false, false, false, false];
  String KeyPadPressed = '';
  List<Widget> ButtonList;
  int inputlength = 0;

  void PressButton(int buttontext) {
    KeyPadPressed += buttontext.toString();
    PressedTrueFalse[KeyPadList.indexOf(buttontext)] = true;
    inputlength += 1;
    setState(() {

    });
  }

  // void MakeButtons(){
  //   int i = 0;
  //   for(;i<9;i++){
  //     ButtonList.add(Button(KeyPadList[i], PressButton, PressedTrueFalse[i]));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    
    // MakeButtons();

    return MaterialApp(
    home: Scaffold(
      body: 
        Container(
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(KeyPadPressed,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
            ResultCheck(KeyPadPressed, inputlength),
            SizedBox(height: 80),
          Container(
            height: 80,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            // Buttons[0], Buttons[1], Buttons[2]
            Button(KeyPadList[0], PressButton, PressedTrueFalse[0]),
            Button(KeyPadList[1], PressButton, PressedTrueFalse[1]),
            Button(KeyPadList[2], PressButton, PressedTrueFalse[2]),
          ])
          ),
          Container(
            height: 80,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Button(KeyPadList[3], PressButton, PressedTrueFalse[3]),
            Button(KeyPadList[4], PressButton, PressedTrueFalse[4]),
            Button(KeyPadList[5], PressButton, PressedTrueFalse[5]),
          ])
          ),
          Container(
            height: 80,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Button(KeyPadList[6], PressButton, PressedTrueFalse[6]),
            Button(KeyPadList[7], PressButton, PressedTrueFalse[7]),
            Button(KeyPadList[8], PressButton, PressedTrueFalse[8]),
          ])
          ),
        ]
        )
      ),
      )
    );
  }
}