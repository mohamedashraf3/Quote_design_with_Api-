import 'package:flutter/material.dart';
import 'package:quote_task/view/screens/splash/splash.dart';
import 'package:quote_task/view_model/data/local/shared_prefrence/shared_prefrence.dart';
import 'package:quote_task/view_model/data/network/dio_helper.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
   await LocalData.init();
   DioHelper.intiState();
  runApp(MaterialApp(
    home:const SplashScreen() ,
    debugShowCheckedModeBanner: !true,
    theme: ThemeData.light(),
  ));
}
