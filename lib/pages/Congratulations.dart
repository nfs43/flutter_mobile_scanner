import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickbazar_delivery/Utils/appcolors.dart';

class Congratulations extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Congratulations> {
  late ConfettiController _controllerCenterLeft;

  @override
  void initState() {
    super.initState();
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerCenterLeft.play();
  }

  @override
  void dispose() {
    _controllerCenterLeft.dispose();
    super.dispose();
  }

  _onBackPressed() async {
    // Get.offAll(RootScreen());
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 180),
                      child: ConfettiWidget(
                        confettiController: _controllerCenterLeft,
                        blastDirection: 0, // radial value - RIGHT
                        emissionFrequency: 0.4,
                        minimumSize: const Size(10,
                            10), // set the minimum potential size for the confetti (width, height)
                        maximumSize: const Size(50,
                            50), // set the maximum potential size for the confetti (width, height)
                        numberOfParticles: 1,
                        gravity: 0.1,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 150, left: 10, right: 10),
                      child: Column(
                        //  mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            //  mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/trophy.png",
                                height: 120.0,
                                width: 200.0,
                                fit: BoxFit.fill,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 50),
                                child: const Text('Congratulations!',
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25,
                                        decoration: TextDecoration.none)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: const Text(
                                    'you have successfuly understand',
                                    maxLines: 2,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        decoration: TextDecoration.none)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: const Text('and have win reward points',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                        decoration: TextDecoration.none)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
