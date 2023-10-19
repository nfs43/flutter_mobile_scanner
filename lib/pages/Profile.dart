// ignore_for_file: prefer_const_constructors

import 'package:pickbazar_delivery/providers/WidgetProvider.dart';
import 'package:pickbazar_delivery/widgets/SettingsWidgets/SettingItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilenState();
  }
}

class ProfilenState extends State<Profile> {
  // SharedPref? prefs;
  // SignInResponse? _signInResponse = SignInResponse.error();

  @override
  void initState() {
    // SharedPref.init().then((value) {
    //   prefs = value;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WidgetProvider>(builder: (BuildContext context, value, Widget? child) {
      // prefs!.clearSharedPreferences();
      //_signInResponse = prefs?.retrieveUserInfo();
      return Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //(_signInResponse?.code == 0)
            (1==1)
                ? Image.asset(
              'assets/icons/ic_default_profile.png',
              height: 150,
              width: 150,
            )
                : CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
              ),
              radius: 80,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 30),
              child: (1==1)
                  ? GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, RoutesName.signInPage)
                  //     .then((value) {
                  //   setState(() {
                  //     _signInResponse = prefs?.retrieveUserInfo();
                  //   });
                  // });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15
                    ),
                  ),
                ),
              )
                  : Text(
                "Nafees",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              child: Text(
                "Account Settings",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SettingsCard("Personal information", Icons.person, () {
              // if (_signInResponse != null)
              //   Navigator.pushNamed(context, RoutesName.profiledetailPage);
            }),
            SettingsCard("Payments and payout", Icons.payments_outlined, () {}),
            SettingsCard(
                "Notifications", Icons.notifications_none_outlined, () {}),
            SettingsCard("Privacy and sharing", Icons.lock_outline_rounded, () {
              // Provider.of<BottomBarProvider>(context, listen: false)
              //     .hideBottomBar(true);
              // Navigator.pushNamed(
              //     context, RoutesName.privacypolicyWebviewPagePage)
              //     .then((value) {
              //   Provider.of<BottomBarProvider>(context, listen: false)
              //       .hideBottomBar(false);
              // });
            }),
          ],
        ),
      );
    },);
  }
}
