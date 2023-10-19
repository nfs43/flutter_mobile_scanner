import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  final String message;

  CustomToast({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.black, // Match Android toast color
        borderRadius: BorderRadius.circular(25.0), // Rounded corners
      ),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white, // Match Android toast text color
          fontSize: 16.0, // Font size
        ),
      ),
    );
  }
}
