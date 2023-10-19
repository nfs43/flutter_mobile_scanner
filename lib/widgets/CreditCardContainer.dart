// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:convert';


// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pickbazar_delivery/network/Response/customerCards.dart';

// class CreditCardContainer extends StatelessWidget {
//   final VoidCallback? onPressed;
//   final int itemID;
//   Data data;
//   CreditCardContainer({required this.itemID,required this.data, this.onPressed});


//   String maskCreditCardNumber(String creditCardNumber) {
//   if (creditCardNumber.length < 4) {
//     return creditCardNumber;
//   }

//   String lastFourDigits = creditCardNumber.substring(creditCardNumber.length - 4);
//   String maskedDigits = "*"* (creditCardNumber.length - 4);

//   return maskedDigits + lastFourDigits;
// }

//   @override
//   Widget build(BuildContext context) {
//     int _itemID = itemID;
//     String _Cardnumber = data.cardinfo.cardnumber; // Replace with your credit card number
//     String _maskedNumber = maskCreditCardNumber(_Cardnumber);
    

//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15.0),
//           color: Colors.blue
//           // image: DecorationImage(
//           //   image: AssetImage('assets/images/graycard.png'),
//           //   fit: BoxFit.cover,
//           // ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(13.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(bottom: 5),
//                 child: Container(
//                   margin: EdgeInsets.only(right: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         data.cardinfo.firstName??"",
//                         style: TextStyle(color: Colors.white, fontSize: 25),
//                       ),

//                        Image.memory(
//                   base64Decode(Constants.icon_visa.substring('data:image/png;base64,'.length),),
//                   fit:BoxFit.fill,
                 
//               ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       '$_maskedNumber',
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                      Padding(
//                        padding: const EdgeInsets.only(left:10),
//                        child: Text(
//                         '12/26',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                                        ),
//                      ),
//                   ],
//                 ),
//               ),
//              Container(
//               margin: EdgeInsets.only(top: 50),
//                child: Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: [
//                      if (_Cardnumber.isNotEmpty&&itemID==0)
//                        ElevatedButton(
//                          onPressed: () {},
//                          style: ElevatedButton.styleFrom(
//                 primary: Colors.black,
//                 onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                          ),
//                          child: Text('Default'),
//                        )
//                      else
//                        ElevatedButton(
//                          onPressed: () => (){},//setAsDefault(item.id),
//                          style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 onPrimary: Colors.black,
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 side: BorderSide(color: Colors.white),
//                          ),
//                          child: Text('Set as default'),
//                        ),
//                      GestureDetector(
//                        //onTap: () => onClickDelete(item),
//                        child: Container(
//                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                          child: Text('Remove',style: TextStyle(color: Colors.white),),
//                        ),
//                      ),
//                    ],
//                  ),
//              )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
