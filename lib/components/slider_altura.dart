import '../constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderAltura extends StatelessWidget {
  final void Function(double value) fn;
    int altura = 120;
   SliderAltura({super.key, required this.fn, required this.altura});



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         const Text(
          'ALTURA',
          style: labelTextStyle,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              altura.toString(),
              style: numberTextStyle,
            ),
            const Text(
              'cm',
              style: labelTextStyle,
            ),
          ],
        ),
        Slider(
          min: 120,
          max: 220,
          value: altura.toDouble(),
          onChanged: fn,
        )
      ],
    );
  }
}
