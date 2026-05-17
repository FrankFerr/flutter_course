import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  Random randomizer = Random();
  int currentDiceNumber = 0;

  _DiceRollerState() : currentDiceNumber = Random().nextInt(6) + 1;

  void rollDice() {
    setState(() {
      currentDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/dice-$currentDiceNumber.png", width: 200),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 24),
            ),
            child: const Text("Roll Dice!"),
          ),
        ),
      ],
    );
  }
}
