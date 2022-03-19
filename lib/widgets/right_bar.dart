import 'package:flutter/material.dart';
import 'package:bmi_calc/constants/app_constants.dart';

class RightBar extends StatelessWidget {
  final double barWidth;

  const RightBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,

      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft:  Radius.circular(20),
            ),
          color: accentHexColor,
          ),
        )
      ],
    );
  }
}
