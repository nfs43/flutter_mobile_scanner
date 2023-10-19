// ignore_for_file: must_be_immutable, no_leading_underscores_for_local_identifiers

//import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pickbazar_delivery/Utils/appcolors.dart';
import 'package:pickbazar_delivery/providers/BottomBarProvider.dart';
import 'package:pickbazar_delivery/providers/WidgetProvider.dart';
import 'package:pickbazar_delivery/routes/RouteGenerator.dart';
import 'package:pickbazar_delivery/widgets/BottomBarWidgets/BottomBarTab.dart';
//import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.messageId}");
// }

class BottomNavBar extends StatelessWidget {
  // late final FirebaseMessaging _messaging;
  // PushNotification? _notificationInfo;
  late String token;

  BottomNavBar({
    Key? key,
  }) : super(key: key){
    initFirebase();
  }

  void initFirebase() {
    //registerNotification();
    //checkForInitialMessage();

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   PushNotification notification = PushNotification(
    //     title: message.notification?.title,
    //     body: message.notification?.body,
    //     dataTitle: message.data['title'],
    //     dataBody: message.data['body'],
    //   );
    //   _notificationInfo = notification;
    //   showNotification();
    // });
    // getToken();
  }

  // void registerNotification() async {
  //   _messaging = FirebaseMessaging.instance;

  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  //   NotificationSettings settings = await _messaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     provisional: false,
  //     sound: true,
  //   );
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       PushNotification notification = PushNotification(
  //         title: message.notification?.title,
  //         body: message.notification?.body,
  //         dataTitle: message.data['title'],
  //         dataBody: message.data['body'],
  //       );
  //       _notificationInfo = notification;
  //       showNotification();
  //     });
  //   } else {
  //     print('User declined or has not accepted permission');
  //   }
  // }

  // void checkForInitialMessage() async {
  //   //await Firebase.initializeApp();
  //   RemoteMessage? initialMessage =
  //   await FirebaseMessaging.instance.getInitialMessage();

  //   if (initialMessage != null) {
  //     PushNotification notification = PushNotification(
  //       title: initialMessage.notification?.title,
  //       body: initialMessage.notification?.body,
  //       dataTitle: initialMessage.data['title'],
  //       dataBody: initialMessage.data['body'],
  //     );
  //     _notificationInfo = notification;
  //     showNotification();
  //   }
  // }

  // void showNotification(){
  //   showSimpleNotification(
  //     Text(_notificationInfo!.title!),
  //     subtitle: Text(_notificationInfo!.body!),
  //     background: Colors.cyan.shade700,
  //     duration: Duration(seconds: 2),
  //   );
  // }

  // getToken() async {
  //   token = (await FirebaseMessaging.instance.getToken())!;
  // }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);
    _controller.addListener(() {
      if(_controller.index==1){
        Provider.of<WidgetProvider>(context,listen: false).refreshWidget(false);
      }else{
        Provider.of<WidgetProvider>(context,listen: false).refreshWidget(false);
      }
    });
    final bottomBarProvider = context.watch<BottomBarProvider>();
    final screen = Provider.of<BottomBarProvider>(context, listen: false);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: screen.screens,
      items: getBottomTabs(screen.getbottombaritems),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
      hideNavigationBar: bottomBarProvider.hide,
    );
  }

  List<PersistentBottomNavBarItem> getBottomTabs(List<MyTabItem> tabs) {
    return tabs
        .map(
          (item) => PersistentBottomNavBarItem(
            icon: Icon(item.icon, size: 30),
            inactiveIcon: Icon(item.icon, size: 30),
            // title: item.title,
            routeAndNavigatorSettings: const RouteAndNavigatorSettings(
                onGenerateRoute: RouteGenerator.generateRoute),
            activeColorPrimary: AppColors.bottombaricon_selected,
            inactiveColorPrimary: AppColors.bottombaricon_unselected,
            iconSize: 25,
          ),
        )
        .toList();
  }
}
