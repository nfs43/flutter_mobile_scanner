// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  String settingName;
  IconData iconData;
  VoidCallback onTapSettingOptions = () {};

  SettingsCard(this.settingName, this.iconData, this.onTapSettingOptions);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTapSettingOptions,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      iconData,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      settingName,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_forward_ios_rounded),
                    ))
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
            indent: 5,
            endIndent: 5,
          )
        ],
      ),
    );
  }
}
