import 'package:flutter/material.dart';

class SwipeToRedeemButton extends StatefulWidget {
  @override
  _SwipeToRedeemButtonState createState() => _SwipeToRedeemButtonState();
}

class _SwipeToRedeemButtonState extends State<SwipeToRedeemButton> {
  double _swipePosition = 0.0;
  bool _redeemed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _swipePosition += details.delta.dx;
          if (_swipePosition > 100) {
            _redeemed = true;
          }
        });
      },
      onPanEnd: (details) {
        setState(() {
          _swipePosition = 0.0;
          _redeemed = false;
        });
      },
      child: Stack(
        children: [
          // Your main content goes here
          Center(
            child: Text('Swipe to Redeem'),
          ),
          // Swipe-to-redeem button overlay
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            top: 0,
            left: _swipePosition,
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: _redeemed ? Text('Redeemed') : Text('Swipe'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}