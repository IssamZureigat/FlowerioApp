import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_widget.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, this.title, this.subTitle, this.image});

  final String? title;
  final String? subTitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
const VerticalSpace(20),

//  PageView Image

      SizedBox(height: SizeConfig.defaultSize!*20,
        child: Image.asset(image!)),
      const VerticalSpace(5),

      //  PageView Title

      Text(
        title!,
        style: TextStyle(
          fontSize: 20,
          color: const Color(0xff2f2e41),
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.left,
      ),
      const VerticalSpace(1),

      //  PageView Subtitle
      
      Text(
        subTitle!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: const Color(0xff78787c),
        ),
        textAlign: TextAlign.left,
      ),
    ]);
  }
}
