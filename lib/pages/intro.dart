// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:pickbazar_delivery/routes/Routes.dart';
import 'package:pickbazar_delivery/widgets/circularborder.dart';
import 'package:pickbazar_delivery/widgets/swipable_button.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: 10,
                        ),
                        child: Text(
                          "1★Star per dollar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "(pay as you go))",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/gifthamperwide.png',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Earn Stars and get Rewards",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "However you'd like to pay, you can earn stars.",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Those Stars add up to (really delicious) Rewards.",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "How it works:",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Getting started is easy",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Earn Stars and get rewarded in a few easy steps.",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircularBlueBorder(text: '1'),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Create an account",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 20),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "To get started, join now. the app to get access to the full range of FastAuth Rewards benefits.",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                maxLines: 7,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RoutesName.signin);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue, // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30.0), // Rounded border
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                              ),
                              child: Text(
                                'Join Us',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            fit: BoxFit.fitHeight,
                            height: 200,
                            'assets/images/contacts.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, right: 20, top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              fit: BoxFit.fitHeight,
                              height: 200,
                              'assets/images/shopwithcard.png',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircularBlueBorder(text: '2'),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Order and pay how you'd like",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 20),
                              child: Text(
                                "Use credit/debit card or save some time and pay right through the fastauth, You'll collect Stars all ways",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                maxLines: 7,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircularBlueBorder(text: '3'),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Earn Stars, get Rewards",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 20),
                              child: Text(
                                "As you earn Stars, you can redeem them for Rewards--like free food, drinks, and more, Start redeeming with as little as 25 Stars!",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                maxLines: 7,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            fit: BoxFit.fitHeight,
                            height: 200,
                            'assets/images/gifthamper.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: SwipingButton(
                      text: "Swipe to Continue",
                      onSwipeCallback: () =>
                          Navigator.pushNamed(context, RoutesName.signin)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
