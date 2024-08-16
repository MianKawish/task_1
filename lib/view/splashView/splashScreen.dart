import 'package:flutter/material.dart';
import 'package:task_1/res/assets/imageAssets.dart';
import 'package:task_1/services/splash/splashServices/splashServices.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _splashServices = SplashServices();
  @override
  void initState() {
    _splashServices.loginUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(Images.splashImage))),
      ),
    );
  }
}
