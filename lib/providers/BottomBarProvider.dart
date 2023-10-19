// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pickbazar_delivery/pages/Profile.dart';
import 'package:pickbazar_delivery/pages/home.dart';
import 'package:pickbazar_delivery/pages/Congratulations.dart';
import 'package:pickbazar_delivery/pages/wallet.dart';
import 'package:pickbazar_delivery/widgets/BottomBarWidgets/BottomBarTab.dart';

class BottomBarProvider extends ChangeNotifier {
  Widget _screen = Home();
  bool _hide = false;

  final List<Widget> screens = [
    Home(),
    Wallet(),
    Profile(),
    Profile(),
    Profile()
  ];

  final List<MyTabItem> _bottombaritems = [
    MyTabItem('Dashboard', Icons.home),
    MyTabItem('Search', Icons.manage_search),
    MyTabItem('notifications', Icons.dataset_sharp),
    MyTabItem('settings', Icons.favorite_border),
    MyTabItem('settings', Icons.shopping_basket_outlined),
  ];

  get getbottombaritems => _bottombaritems;

  set screen(screen) {
    _screen = screen;
    notifyListeners();
  }

  get screen => _screen;

  void hideBottomBar(bool hide) {
    _hide = hide;
    notifyListeners();
  }

  get hide => _hide;
}
