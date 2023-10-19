import 'package:flutter/material.dart';

class GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String? routeName;
  final Map<String, dynamic>? args;

  GeneratePageRoute({required this.widget, this.routeName, this.args})
      : super(
            settings: RouteSettings(name: routeName, arguments: args),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
}
