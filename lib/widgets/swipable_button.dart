// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickbazar_delivery/widgets/swipeable.dart';

/// A Button that can detect swiping movement with shimmering arrows on far end.
class SwipingButton extends StatelessWidget {
  /// The text that the button will display.
  final String text;

  /// The callback invoked when the button is swiped.
  final VoidCallback onSwipeCallback;

  SwipingButton({
    Key? key,
    required this.text,
    required this.onSwipeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 60.0,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(50.0)),
          ),
          SwipeableWidget(
            height: 60.0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: _buildContent(),
              ),
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            onSwipeCallback: onSwipeCallback,
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    final textStyle = TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white);
    return Flexible(
      flex: 6,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text.toUpperCase(),
          style: textStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: SvgPicture.asset(
            'assets/icons/double-forward-arrow.svg',
            width: 40,
            height: 40,
          ),
        ),
        _buildText(),
      ],
    );
  }
}
