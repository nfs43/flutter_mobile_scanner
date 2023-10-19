// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pickbazar_delivery/Utils/appcolors.dart';
import 'package:pickbazar_delivery/pages/home.dart';
import 'package:pickbazar_delivery/pages/root.dart';
import 'package:pickbazar_delivery/providers/ApiProvider.dart';
import 'package:pickbazar_delivery/providers/BottomBarProvider.dart';
import 'package:pickbazar_delivery/providers/WidgetProvider.dart';
import 'package:pickbazar_delivery/routes/RouteGenerator.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
   // Set the status bar color to blue 
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle( 
            statusBarColor: AppColors.dashboard_header_color, 
      )); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ApiProvider()),
          ChangeNotifierProvider(create: (context) => BottomBarProvider()),
          ChangeNotifierProvider(create: (context) => WidgetProvider()),
        ],
        child: OverlaySupport(
          child: MaterialApp(
              title: 'PickBazar Delivery',
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.generateRoute,
              home: Root()),
        ));
  }
}
