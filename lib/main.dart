import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audio_cache.dart';

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
  int sum = 0;

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(onPhoneShake: () {
      Vibration.vibrate(duration: 100);
      randomizeDice();
      AudioCache().play('number$sum.wav');
      print('Shaked!');
    });
  }

  void randomizeDice() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
      sum = leftDiceNum + rightDiceNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Column(
      children: [
        sum == 0
            ? Text(
                'Shake To Roll!',
                style: TextStyle(fontSize: 90.0, color: Colors.white),
                textAlign: TextAlign.center,
              )
            : Text(sum.toString(),
                style: TextStyle(fontSize: 180.0, color: Colors.white)),
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('assets/images/dice$leftDiceNum.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('assets/images/dice$rightDiceNum.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
