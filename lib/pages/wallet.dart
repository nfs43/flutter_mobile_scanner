// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, camel_case_types, use_key_in_widget_constructors


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickbazar_delivery/helper/SharedPref.dart';
import 'package:pickbazar_delivery/network/Apis.dart';
import 'package:pickbazar_delivery/widgets/CreditCardContainer.dart';
import 'package:pickbazar_delivery/widgets/ProgressIndicator/LoadingWidget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pickbazar_delivery/network/Response/customerCards.dart';

class Wallet extends StatefulWidget {
  @override
  WalletState createState() => WalletState();
}

class WalletState extends State<Wallet> {
  SharedPref? prefs;
  late CustomerAllCards customerAllCards;
  //CustomerData? customerData;
  bool isLoading = true;

  List<Map<String, dynamic>> itemList = [
    {
      'icon': 'assets/icons/stars.svg',
      'text': 'Shopping Cart',
    },
    {
      'icon': 'assets/icons/gift-wg.svg',
      'text': 'Favorites',
    },
    {
      'icon': 'assets/icons/phone.svg',
      'text': 'Order History',
    },
  ];

  // List<OrderAgainItem> orderAgainItems = [
  //   OrderAgainItem(
  //     dealUrl: 'assets/images/rewardDeal1.png',
  //     dealName: 'Buy 1, Get 1 free at Greeno',
  //     startsforDeal: '390 stars',
  //   ),
  //   OrderAgainItem(
  //     dealUrl: 'assets/images/rewardDeal2.png',
  //     dealName: 'Buy 1, Get 1 free at Starbucks',
  //     startsforDeal: '500 stars',
  //   ),
  //   OrderAgainItem(
  //     dealUrl: 'assets/images/rewardDeal3.png',
  //     dealName: 'Buy 1, Get 1 free at Papa Johns',
  //     startsforDeal: '200 stars',
  //   ),
  //   OrderAgainItem(
  //     dealUrl: 'assets/images/rewardDeal3.png',
  //     dealName: 'Buy 1, Get 1 free at Papa Johns',
  //     startsforDeal: '200 stars',
  //   ),
  //   OrderAgainItem(
  //     dealUrl: 'assets/images/rewardDeal3.png',
  //     dealName: 'Buy 1, Get 1 free at Papa Johns',
  //     startsforDeal: '200 stars',
  //   ),
  //   OrderAgainItem(
  //     dealUrl: 'assets/images/rewardDeal3.png',
  //     dealName: 'Buy 1, Get 1 free at Papa Johns',
  //     startsforDeal: '200 stars',
  //   ),
  //   OrderAgainItem(
  //     dealUrl: 'assets/images/rewardDeal3.png',
  //     dealName: 'Buy 1, Get 1 free at Papa Johns',
  //     startsforDeal: '200 stars',
  //   ),
  //   OrderAgainItem(
  //     dealUrl: 'assets/images/rewardDeal3.png',
  //     dealName: 'Buy 1, Get 1 free at Papa Johns',
  //     startsforDeal: '200 stars',
  //   ),
  // ];

  String maskCreditCardNumber(String creditCardNumber) {
    if (creditCardNumber.length < 4) {
      return creditCardNumber;
    }

    String lastFourDigits =
        creditCardNumber.substring(creditCardNumber.length - 4);
    String maskedDigits = "*" * (creditCardNumber.length - 4);

    return maskedDigits + lastFourDigits;
  }

  ScrollController nestedScrollController = ScrollController();
  bool showHeader = true;
  double _expandedHeight = 300;
  static const platform = MethodChannel('com.startActivity/testChannel');

  Future<void> _startActivity(userId) async {
    try {
      final String result = await platform
          .invokeMethod('StartSecondActivity', {'userId': userId});
      debugPrint('Result: $result ');
    } on PlatformException catch (e) {
      debugPrint("Error: '${e.message}'.");
    }
  }

  @override
  void initState() {
    super.initState();
    nestedScrollController.addListener(_scrollListener);

    SharedPref.init().then((value) {
      prefs = value;
      //customerData = prefs?.retrieveUserInfo();
    //    Apis.init()
    //     .FetchAllCards(FetchAllCardsReq(id: customerData!.customer!.id.toString()).toJson())
    //     .then((value) {
    //   customerAllCards = value;
    //   isLoading = true;
    // });

    Map<String, String> myMap = {
    'id': '1'
  };

  Apis.init()
        .FetchAllCards( myMap
    )
        .then((value) {
      customerAllCards = value;
                    isLoading = false;

      setState(() {

      });
    });
    
   
    });

   
  }

  @override
  void dispose() {
    nestedScrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      showHeader =
          nestedScrollController.offset < _expandedHeight - kToolbarHeight;
    });
  }

  void _openDialPad(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: isLoading?LoadingWidget():Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: SvgPicture.asset(
                  'assets/icons/add-circle.svg',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: customerAllCards.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () async {
                        // Navigator.pushNamed(context, RoutesName.dealsdetail).then((value) {
                        //   Provider.of<BottomBarProvider>(context, listen: false)
                        //       .hideBottomBar(false);
                        // });
                        //     await platformMethodChannel.invokeMethod('setToast', {
                        // 'myText':'This text will show in toast by native channel',
                        // _startActivity();
                      },
                      child: Container());
                //       child: CreditCardContainer(
                //         itemID: index,
                //         data: customerAllCards.data!.elementAt(index),
                //       ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
