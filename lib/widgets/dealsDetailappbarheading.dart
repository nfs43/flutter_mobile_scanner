// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:pickbazar_delivery/providers/BottomBarProvider.dart';
import 'package:provider/provider.dart';

class TabHeader extends StatefulWidget {
  ScrollController nestedScrollController;

  TabHeader({
    required this.nestedScrollController,
  });

  @override
  State<TabHeader> createState() => _TabHeaderState();
}

class _TabHeaderState extends State<TabHeader> {
  late ScrollController nestedScrollController;
  bool showHeader = true;

  @override
  void initState() {

WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BottomBarProvider>(context, listen: false)
          .hideBottomBar(true);
    });

    nestedScrollController = widget.nestedScrollController;

    nestedScrollController.addListener(() {
      showHeader ? setState(() {}) : null;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!nestedScrollController.position.hasContentDimensions) {
      return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      width: double.infinity,
      height: 64,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(
            left: 10 , top: 15.0),
        padding: EdgeInsets.only(top: 4),
        child: AnimatedDefaultTextStyle(
            child: Text(
              "Buy 1, Get 1 Free at NY Pizza",
            ),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.0 ,
            ),
            //get 47% or lesser value of maxScrollSize and divide by maxScrollSize to get fonrSize b/w 15 and 7
            duration: Duration(milliseconds: 400)),
      ),
    );
    }
    var maxScrollExtent = nestedScrollController.position.maxScrollExtent;
    var cutOffScrollPercent = 0.50;
    var currentOffset =
        showHeader ? maxScrollExtent - nestedScrollController.offset : 0.0;
    var currentScrollPercent = nestedScrollController.offset / maxScrollExtent;
    var _fontSize = showHeader ? 30.0 : 15.0;
    var _marginLeft = showHeader ? 10.0 : 45.0;
    if (showHeader) {
      _fontSize = (currentScrollPercent > cutOffScrollPercent
              ? cutOffScrollPercent
              : currentOffset / maxScrollExtent) *
          30;
      _marginLeft = currentScrollPercent * 70;
    } else {
      nestedScrollController.removeListener(() {});
      // nestedScrollController!.detach(nestedScrollController!.position);
      // nestedScrollController.removeListener(() { });
    }
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      width: double.infinity,
      height: 64,
      color: Colors.grey.shade50,
      child: Container(
        margin: EdgeInsets.only(
            left: _marginLeft<=10 ? 10 : _marginLeft < 50 ? _marginLeft : 50, top: 15.0),
        padding: EdgeInsets.only(top: 4),
        child: AnimatedDefaultTextStyle(
            child: Text(
              "Buy 1, Get 1 Free at NY Pizza",
            ),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: _fontSize < 20.0 ? 20.0 : _fontSize-5,
            ),
            //get 47% or lesser value of maxScrollSize and divide by maxScrollSize to get fonrSize b/w 15 and 7
            duration: Duration(milliseconds: 400)),
      ),
    );
  }
}
