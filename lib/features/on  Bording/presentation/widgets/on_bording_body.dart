// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flowerio_app/core/constants.dart';
import 'package:flowerio_app/core/widgets/custom_buttons.dart';
import 'package:flowerio_app/features/on%20%20Bording/presentation/widgets/custom_indicator_dots.dart';
import 'package:flowerio_app/features/on%20%20Bording/presentation/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../../core/utils/size_config.dart';
import '../../../Auth/presentation/Login_viwe.dart';

class OnBordaingBody extends StatefulWidget {
  const OnBordaingBody({super.key});

  @override
  State<OnBordaingBody> createState() => _OnBordaingBodyState();
}

class _OnBordaingBodyState extends State<OnBordaingBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),

        // dots
        Positioned(
            bottom: SizeConfig.defaultSize! * 20,
            left: 0,
            right: 0,
            child: CustomIndicator(
                dotIndex:
                    pageController!.hasClients ? pageController?.page : 0)),
        
        
        // skip 
        
        Visibility(visible:pageController!.hasClients ? (pageController!.page == 2 ? false :true) :true,
          child: Positioned(
            top: SizeConfig.defaultSize! * 10,
            right: 32,
            child: Text("Skip",
                style: TextStyle(fontSize: 14, color: Color(0xff898989)),
                textAlign: TextAlign.left),
          ),
        ),

        // button
        Positioned(
            bottom: SizeConfig.defaultSize! * 10,
            left: SizeConfig.defaultSize! * 10,
            right: SizeConfig.defaultSize! * 10,
            child: CustomGeneralButton(
              // text: pageController!.hasClients ? (pageController!.page == 2 ? "Get Strated" :"Next") : "Next",

                onTap: () {
                if (pageController!.page! < 2) {
                  pageController?.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                } else {
                  Get.to(() => LogInView(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 500));
                }
              },
              text: pageController!.hasClients
                  ? (pageController?.page == 2 ? 'Get started' : 'Next')
                  : 'Next',
            
            )),
      ],
    );
  }
}
