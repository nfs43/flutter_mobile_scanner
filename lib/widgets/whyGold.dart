// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WhyGold extends StatefulWidget {
  @override
  _WhyGoldState createState() => _WhyGoldState();
}

class _WhyGoldState extends State<WhyGold> with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> itemList = [
    {
      'icon': 'assets/icons/stars.svg',
      'text': 'Shopping Cart',
    },
    {
      'icon': 'assets/icons/gift-wg.svg',
      'text': 'Favorites',
    },
    {
      'icon': 'assets/icons/phone.svg',
      'text': 'Order History',
    },
  ];

  bool isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5, // Rotate to 180 degrees
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleExpansion,
          behavior: HitTestBehavior.translucent,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Why Gold?',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Spacer(),
                RotationTransition(
                  turns: _rotateAnimation,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 20,
                    child: SvgPicture.asset(
                      'assets/icons/arrow-down.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isExpanded ? itemList.length * 60.0 : 0.0,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                      child: SvgPicture.asset(
                        itemList[index]['icon'],
                        width: 70,
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        itemList[index]['text'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
