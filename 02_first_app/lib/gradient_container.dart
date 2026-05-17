import 'package:flutter/material.dart';
import 'package:first_app/dice_roller.dart';

const AlignmentGeometry startAlignment = AlignmentGeometry.topCenter;
const AlignmentGeometry endAlignment = AlignmentGeometry.bottomCenter;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
