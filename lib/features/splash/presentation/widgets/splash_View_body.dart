import 'package:flowerio_app/features/on%20%20Bording/presentation/bording_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/size_config.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? fadingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 850));
    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController!)
          ..addListener(() {
            setState(() {
              if (animationController!.isCompleted) {
                animationController?.repeat(reverse: true);
              }
            });
          });

    animationController?.forward();
// fuction to navigat next view automaticly
    goToNextView();
  }

  @override
  Widget build(BuildContext context) {
// init for sizeConfig
SizeConfig().init(context);

    return Center(
      child: Opacity(
          opacity: fadingAnimation?.value,
          child: Image.asset("images/Logo.png")),
    );
  }

  // difine the function
  // use ()=> because this way will remove the befor data for the controller from the memory
  // transition : it's for moving animate
  void goToNextView() {
    Future.delayed(
      Duration(seconds: 5),
      () {
        Get.to(() => OnBordingView(),transition: Transition.fade);
      },
    );
  }
}
