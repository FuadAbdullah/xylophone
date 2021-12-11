import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> keyColor = {
      1: Colors.red,
      2: Colors.orange,
      3: Colors.yellow,
      4: Colors.green,
      5: Colors.teal,
      6: Colors.blue,
      7: Colors.purple,
    };

    void playSound(int n) {
      final AudioCache player = AudioCache();
      player.play('note$n.wav');
    }

    Expanded buildKey({int index, Color color}) {
      return Expanded(
        child: MaterialButton(
          color: color,
          onPressed: () => playSound(index),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              7, // 0 - 6
              (index) => buildKey(
                index: index + 1, // 1 - 7
                color: keyColor[index + 1], // 1 - 7
              ),
            ),
          ),
        ),
      ),
    );
  }
}
