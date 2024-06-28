import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yacka_mobile/routes/app_pages.dart';
import 'package:yacka_mobile/view/screens/auth/login_screen.dart';
import 'package:yacka_mobile/view/screens/auth/signup_screen.dart';
import 'package:yacka_mobile/view/screens/home_screen.dart';
import 'package:yacka_mobile/view/screens/product_detail_screen.dart';
import 'package:yacka_mobile/view/screens/profile_screen.dart';
import 'package:yacka_mobile/view/screens/rewards_screen.dart';
import 'package:yacka_mobile/view/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: SignUp(),
    );
  }
}
