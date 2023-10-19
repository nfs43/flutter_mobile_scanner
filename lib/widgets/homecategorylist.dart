// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

// import 'package:checkout/providers/BottomBarProvider.dart';
// import 'package:checkout/routes/Routes.dart';
// import 'package:checkout/widgets/circularIndicator.dart';
// import 'package:checkout/models/orderAgainlist.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pickbazar_delivery/providers/BottomBarProvider.dart';
// import 'package:pickbazar_delivery/routes/Routes.dart';
// import 'package:provider/provider.dart';

// class homecategorylist extends StatelessWidget {


//   final List<OrderAgainItem> orderAgainItems;


// //  static const platform = const MethodChannel('com.startActivity/testChannel');


// homecategorylist({required this.orderAgainItems});

// // Future<void> _startActivity() async {
// //     try {
// //       final String result = await platform.invokeMethod('StartSecondActivity');
// //       debugPrint('Result: $result ');
// //     } on PlatformException catch (e) {
// //       debugPrint("Error: '${e.message}'.");
// //     }
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 170,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: orderAgainItems.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: () async {
//               Navigator.pushNamed(context, RoutesName.dealsdetail).then((value) {
//                 Provider.of<BottomBarProvider>(context, listen: false)
//                     .hideBottomBar(false);
//               });
//           //     await platformMethodChannel.invokeMethod('setToast', {
//           // 'myText':'This text will show in toast by native channel',
//           // _startActivity();
//             },
//             child: Container(
//               margin: EdgeInsets.only(right: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(5),
//                     child: Image.asset(
//                       orderAgainItems[index].dealUrl,
//                       width: 120,
//                       height: 90,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Container(
//                     width: 120,
//                     margin: EdgeInsets.only(top: 15, bottom: 10),
//                     child: Text(
//                       orderAgainItems[index].dealName,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Text(
//                     orderAgainItems[index].startsforDeal,
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
