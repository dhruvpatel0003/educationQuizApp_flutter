import 'package:education_app/config/themes/app_colors.dart';
import 'package:education_app/widgets/app_circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:Get.width*0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),

              SizedBox(height: 40,),
              const Text(
                style : TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold
                ),
                  textAlign:TextAlign.center,
                  "Welcome to the study App. In this app frontend implements in flutter and backend with the help of firebase"),
              SizedBox(height: 40,),
              AppCircleButton(
                onTap:(){
                  Get.toNamed("/home");
                },
                child: const Icon(Icons.arrow_forward,size:35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
