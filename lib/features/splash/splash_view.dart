import 'package:flowerio_app/core/constants.dart';
import 'package:flowerio_app/features/splash/presentation/widgets/splash_View_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainColor,body: SplashBody(),);
  }
}
