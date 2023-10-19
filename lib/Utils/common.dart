import 'package:flutter/material.dart';
import 'package:pickbazar_delivery/widgets/CustomToast.dart';

class Common {
  static showLoaderDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(16),
            // decoration: BoxDecoration(
            //   color: Colors.black87, // Background color for the dialog
            //   borderRadius: BorderRadius.circular(10), // Rounded corners
            // ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Color of the CircularProgressIndicator
                ),
                SizedBox(height: 16),
                Text(
                  'Loading...',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showCustomToast(BuildContext context, String message) {
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (BuildContext context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width,
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CustomToast(message: message),
        ),
      ),
    ),
  );

  Overlay.of(context)!.insert(overlayEntry);

  // Remove the toast after a delay (e.g., 2 seconds)
  Future.delayed(Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
}
