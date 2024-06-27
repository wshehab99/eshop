import 'package:flutter/material.dart';

import '../../app/support/helpers.dart';
import '../../config/app.dart';
import '../../resources/assets/assets_manager.dart';
import '../../resources/routing/route_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _wait() async {
    await Future.wait([
      Future.delayed(AppConfig.splashDelay),
    ]).then(
      (value) => redirectReplace(context, RouteManager.main),
    );
  }

  double size = 50;

  startAnimation(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    size = size * 25;

    setState(() {});
  }

  @override
  void initState() {
    // _wait();
    startAnimation(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: width(context),
      height: height(context),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xfffabe12),
                Color(0xffFFB84E),
              ],
            )),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            bottom: -height(context) / 10,
            right: -height(context) / 10,
            child: AnimatedContainer(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              duration: const Duration(milliseconds: 600),
              width: size,
              height: size,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              onEnd: () => redirectReplace(context, RouteManager.main),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: height(context) / 4,
                height: width(context) / 2,
                child: Image.asset(
                  AssetsManager.logo,
                  fit: BoxFit.fitWidth,
                ),
              ),
            )),
          ),
        ],
      ),
    ));
  }
}
