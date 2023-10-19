// ignore_for_file: file_names, prefer_const_constructors


import 'package:pickbazar_delivery/pages/intro.dart';
import 'package:pickbazar_delivery/pages/pointsInfo.dart';
import 'package:pickbazar_delivery/pages/redeemrewards.dart';
import 'package:pickbazar_delivery/pages/Congratulations.dart';
import 'package:pickbazar_delivery/pages/root.dart';
import 'package:pickbazar_delivery/pages/scanner.dart';
import 'package:pickbazar_delivery/routes/GeneratePageRoute.dart';
import 'package:pickbazar_delivery/routes/Routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.root:
        return GeneratePageRoute(
            widget: const Root(), routeName: settings.name);
      case RoutesName.wallet:
        return GeneratePageRoute(
            widget: PointsInfo(), routeName: settings.name);
      case RoutesName.rewards:
        return GeneratePageRoute(
            widget: PointsInfo(), routeName: settings.name);
      case RoutesName.profile:
        return GeneratePageRoute(
            widget: PointsInfo(), routeName: settings.name);
      case RoutesName.qrscanner:
        return GeneratePageRoute(
            widget: QrScanner(), routeName: settings.name);
      case RoutesName.redeemrewards:
        return GeneratePageRoute(widget: RedeemRewards(), routeName: settings.name);
      case RoutesName.congratulations:
        return GeneratePageRoute(widget: Congratulations(), routeName: settings.name);
      // case RoutesName.pinCodeverification:
      //   return GeneratePageRoute(
      //       widget: PinCodeVerification(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, String>);
      // case RoutesName.viewalldeals:
      //   return GeneratePageRoute(
      //       widget: ViewAllDeals(), routeName: settings.name);
      // case RoutesName.addefaultcard:
      //   return GeneratePageRoute(
      //       widget: addDefaultCard(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, dynamic>);
      // case RoutesName.profilePage:
      //   return GeneratePageRoute(
      //       widget: WishListScreen(), routeName: settings.name);
      // case RoutesName.storeDetailPage:
      //   return GeneratePageRoute(
      //       widget: StoreDetailScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, dynamic>);
      // case RoutesName.portfolioComments:
      //   return GeneratePageRoute(
      //       widget: PortfolioCommentsScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, dynamic>);
      // case RoutesName.searchExplorePage:
      //   return GeneratePageRoute(
      //       widget: FilterScreen(), routeName: settings.name);
      // case RoutesName.appointmentbookingPage:
      //   return GeneratePageRoute(
      //       widget: AppointmentBookingPage(), routeName: settings.name);
      // case RoutesName.signInPage:
      //   return GeneratePageRoute(
      //       widget: SignInScreen(), routeName: settings.name);
      // case RoutesName.signUpPage:
      //   return GeneratePageRoute(
      //       widget: SignupScreen(), routeName: settings.name);
      // case RoutesName.favStoresPage:
      //   return GeneratePageRoute(
      //       widget: WishlistStoreScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, String>);
      // case RoutesName.bookservicesWebviewPage:
      //   return GeneratePageRoute(
      //       widget: BookServicesPage(),
      //       routeName: settings.name,
      //       args: {'Storedetails': Data} );
      // case RoutesName.privacypolicyWebviewPagePage:
      //   return GeneratePageRoute(
      //       widget: PrivacyPolicyPage(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, String>);
      // case RoutesName.profiledetailPage:
      //   return GeneratePageRoute(
      //       widget: ProfileDetailScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, String>);
      default:
        return GeneratePageRoute(
            widget: const Root(), routeName: settings.name);
    }
  }
}
