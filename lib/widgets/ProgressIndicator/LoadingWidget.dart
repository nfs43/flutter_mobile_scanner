import 'package:flutter/material.dart';
import 'package:pickbazar_delivery/widgets/ProgressIndicator/SpinkitCircle.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: Colors.grey.shade400,
    );
  }
}
