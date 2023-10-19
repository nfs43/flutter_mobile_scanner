// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickbazar_delivery/Utils/appcolors.dart';
import 'package:pickbazar_delivery/providers/BottomBarProvider.dart';
import 'package:pickbazar_delivery/routes/Routes.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<Home> with SingleTickerProviderStateMixin {
  double _value = 100.0;
  late Animation<double> _rotateAnimation;
  bool isExpanded = false;
  late AnimationController _animationController;

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
    return Container(
      color: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 30),
              color: AppColors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 40,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Spacer(),
                        IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.black,
                            size: 40,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors
                                .light_grey, // Set the desired border color
                            width: 2.0, // Set the border width
                          ),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: AppColors.black,
                                size: 30,
                              ),
                              onPressed: () {
                                //Navigator.pop(context);
                              },
                            ),
                            Text(
                              'Search with Order ID...',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.black,
                            width: 2.0,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.qr_code_scanner,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () {
                            Provider.of<BottomBarProvider>(context,
                                    listen: false)
                                .hideBottomBar(true);

                            Navigator.pushNamed(context, RoutesName.redeemrewards)
                                .then(((value) {
                              Provider.of<BottomBarProvider>(context,
                                      listen: false)
                                  .hideBottomBar(false);
                            }));
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Recent",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: AppColors.black),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: AppColors.dashboard_light_green),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.greenpendingbox,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '01',
                            style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                color: AppColors.light_grey,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Pending',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.light_grey),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightgreydeliveredbox,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '20',
                            style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delivery_dining_rounded,
                                color: AppColors.light_grey,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Delivered',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.light_grey),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
