import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final audioPlayer = AudioPlayer();
  int _diceNumber = 1;

  @override
  void initState() {
    super.initState();
    // Prepare the audio player
    audioPlayer.play("sounds/rolling_dice.mp3");
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  void _rollDice() async {
    // Play rolling sound
    await audioPlayer.play('e.g., roll_dice.mp3');
    setState(() {
      _diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/dice$_diceNumber.png',
              height: 200,
              width: 200,
            ),
            ElevatedButton(
              onPressed: _rollDice,
              child: Text('Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }
}
