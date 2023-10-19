// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PointsInfo extends StatefulWidget {
  @override
  _PointsInfoState createState() => _PointsInfoState();
}

class _PointsInfoState extends State<PointsInfo>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> itemList = [
    {
      'icon': 'assets/icons/gift.svg',
      'text': 'Shopping Cart',
    },
    {
      'icon': 'assets/icons/gift.svg',
      'text': 'Favorites',
    },
    {
      'icon': 'assets/icons/gift.svg',
      'text': 'Order History',
    },
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        "0",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "stars",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Text(
                  "0 stars expiring on 30 jun, 2023",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: 'ALL'),
                  Tab(text: 'EARNED'),
                  Tab(text: 'USED'),
                ],
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey.shade500,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Center(child: Text('All Content')),
                    Center(child: Text('Earned Content')),
                    Center(child: Text('Used Content')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
