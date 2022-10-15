import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/size_config.dart';

class LogInButton extends StatelessWidget {
  LogInButton({required this.onTap, this.ButtonTitle});
  Function() onTap;
  String? ButtonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      
      child: Container(
      
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color:kMainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text("Log in",
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),);
    
    
    
    
    
    /*
    ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 10, 87, 92),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      onPressed: OnPressing,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 9),
        child: Text(
          "$ButtonTitle",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
    */
  }
}