import 'package:flutter/material.dart';

class BarsOfChart extends StatelessWidget {
  final double fill;
  const BarsOfChart({super.key, required this.fill});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: fill,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 143, 220, 220),
                  Color.fromARGB(255, 35, 117, 124)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
