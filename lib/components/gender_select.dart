import 'package:flutter/material.dart';

import '../constants.dart';

class GenderSelect extends StatelessWidget {
  final IconData genderIcon;
  final String text;
  const GenderSelect({super.key, required this.genderIcon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 90,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
