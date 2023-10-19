// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:pickbazar_delivery/pages/home.dart';
import 'package:pickbazar_delivery/pages/pointsInfo.dart';
import 'package:pickbazar_delivery/pages/Congratulations.dart';
import 'package:pickbazar_delivery/widgets/BottomBarWidgets/BottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overlay_support/overlay_support.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              SafeArea(
                child: Scaffold(
                  bottomNavigationBar: BottomNavBar(),
                ),
              ),
              // Consumer<ApiProvider>(
              //   builder: (BuildContext context, value, Widget? child) {
              //     WidgetsBinding.instance.addPostFrameCallback((_) {
              //       if (value.isLoaderVisible()) {
              //         if (isLoading) return;
              //         isLoading = true;
              //         showLoaderDialog(context);
              //       } else {
              //         if (!isLoading) return;
              //         isLoading = false;
              //         Navigator.pop(context);
              //       }
              //     });
              //     return const SizedBox();
              //   },
              // )
            ],
          ),
        ); }
}
