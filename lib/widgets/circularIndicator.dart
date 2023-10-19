import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickbazar_delivery/helper/circlePainter.dart';

class CircleProgressBar extends StatelessWidget {
  final double percentage; // The percentage value (0 to 100)

  CircleProgressBar({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70, // Adjust the size of the circle as needed
      height: 70,
      child: CustomPaint(
        painter: CirclePainter(percentage: percentage,strokeWidth: 2),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/crown.svg',
            width: 70,
            height: 40,
          ),
        ),
      ),
    );
  }
}

