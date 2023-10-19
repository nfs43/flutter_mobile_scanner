// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickbazar_delivery/helper/circlePainter.dart';

class RewardStatusCircleProgressBar extends StatelessWidget {
  final double percentage; // The percentage value (0 to 100)

  RewardStatusCircleProgressBar({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190, // Adjust the size of the circle as needed
      height: 140,
      child: CustomPaint(
        painter: CirclePainter(percentage: percentage,strokeWidth: 6),
        child: Column(
          children: 
            [ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.amber, BlendMode.srcIn),
              child: SvgPicture.asset(
                'assets/icons/crown.svg',
                width: 70,
                height: 80,
              ),
            ),
            Text('1/15',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
            Text('completed',style: TextStyle(color: Colors.black,fontSize: 12),)
          ],
        ),
      ),
    );
  }
}
