import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  void randomizeDice(){
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
     rightDiceNum=Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
                child: Image.asset('images/dice$leftDiceNum.png'),
                onPressed: () {
                 randomizeDice();
                }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              child: Image.asset('images/dice2.png'),
              onPressed: ()=>randomizeDice(),
            ),
          ),
        ),
      ],
    );
  }
}

