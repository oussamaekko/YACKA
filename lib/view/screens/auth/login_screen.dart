import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:yacka_mobile/core/constant/color.dart';
import 'package:yacka_mobile/view/screens/auth/signup_screen.dart';
import 'package:yacka_mobile/view/screens/welcome_screen.dart';
import 'package:yacka_mobile/view/widgets/login_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      "Hello Again!",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: appColors.heading1),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Welcome back you've \n been missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: appColors.subtitle),
                    ),
                    const SizedBox(height: 30),
                    LoginInput(
                      label: 'Enter username',
                    ),
                    const SizedBox(height: 10),
                    LoginInput(
                      label: 'Password',
                      suffixx: true,
                    ),
                    const SizedBox(height: 17),
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Recovery password",
                        style: TextStyle(
                          fontSize: 15,
                          color: appColors.subtitle,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color.fromARGB(255, 233, 229, 229),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Container(
                      child: Text(
                        "Or continue with ",
                        style: TextStyle(color: appColors.heading1),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/facebookicon.png'),
                        ),
                        const SizedBox(width: 40),
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/appleicon.png'),
                        ),
                        const SizedBox(width: 40),
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/googleicon.png'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not a member? ",
                            style: TextStyle(
                              color: appColors.heading1,
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              "Register now",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () => Get.to(() => SignUp()),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
