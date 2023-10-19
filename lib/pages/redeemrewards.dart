// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickbazar_delivery/Utils/appcolors.dart';
import 'package:pickbazar_delivery/routes/Routes.dart';
import 'package:pickbazar_delivery/widgets/dealsDetailappbarheading.dart';
import 'package:pickbazar_delivery/widgets/stepText.dart';
import 'package:url_launcher/url_launcher.dart';

class RedeemRewards extends StatefulWidget {
  @override
  _DealsDetailState createState() => _DealsDetailState();
}

class _DealsDetailState extends State<RedeemRewards> {
  ScrollController nestedScrollController = ScrollController();
  bool showHeader = true;
  double _expandedHeight = 300;
  static const platform = MethodChannel('com.startActivity/testChannel');

  Future<void> _startActivity(userId) async {
    try {
      final String result = await platform
          .invokeMethod('StartSecondActivity', {'userId': userId});
      debugPrint('Result: $result ');
    } on PlatformException catch (e) {
      debugPrint("Error: '${e.message}'.");
    }
  }

  @override
  void initState() {
    nestedScrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    nestedScrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      showHeader =
          nestedScrollController.offset < _expandedHeight - kToolbarHeight;
    });
  }

  void _openDialPad(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      'assets/images/scan.jpg',
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 4,
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel_sharp,
                        color: Colors.white,
                        size: 60,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Shop & Go',
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text.rich(
                  TextSpan(
                    text: 'Skip the line and save\ntime and Shop & Go',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  maxLines: 2,
                  overflow:
                      TextOverflow.ellipsis, // Adjust this property as needed
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'With Pickbazaar App, you can scan\npurchases as you shop, then pay at kisok on\nthe way out.\nSo long, checkout lines!',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'You can always turn this feature on or off in your account',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 80),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.qrscanner);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    primary: Colors.blue,
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
