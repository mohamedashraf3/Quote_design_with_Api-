import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quote_task/view/screens/home/home.dart';
import 'package:quote_task/view_model/data/local/shared_prefrence/shared_keys.dart';
import 'package:quote_task/view_model/data/local/shared_prefrence/shared_prefrence.dart';
import 'package:quote_task/view_model/utils/colors.dart';

import '../../../view_model/utils/images.dart';
import '../login/login.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash:AppImage.splash ,
      nextScreen: (LocalData.get(SharedKeys.isLogin) ?? false) ? const HomeScreen() : const LoginScreen(),
      splashTransition: SplashTransition.rotationTransition,
      splashIconSize: 200,
      backgroundColor:AppColors.pink,
    );
  }
}
