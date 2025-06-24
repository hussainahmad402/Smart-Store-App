import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartstore/controller/auth_controller.dart';
import 'package:smartstore/controller/theme_controller.dart';
import 'package:smartstore/utils/app_theme.dart';
import 'package:smartstore/view/splash_screen.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    title: "Smart Store",
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    themeMode: themeController.theme,
    defaultTransition: Transition.fade,
    home:  SplashScreen(),
    
    );
  
  }
}
