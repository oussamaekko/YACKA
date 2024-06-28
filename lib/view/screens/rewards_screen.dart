import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yacka_mobile/view/widgets/gift_card_widget.dart';
import 'package:yacka_mobile/view/widgets/list_category_widget.dart';

class RewardPage extends StatelessWidget {
  const RewardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: Get.height * 0.09,
              child: Image.asset("assets/images/reward_icon.png"),
            ),
            SizedBox(height: 20),
            Text(
              "Rewards",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            ListCategories(),
            //TODO : TO ROW REAWD LIST ....
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GiftCardButton(
                  text: "",
                  price: "",
                  image: "assets/images/gift/google.png",
                ),
                GiftCardButton(
                  text: "",
                  price: "",
                  image: "assets/images/gift/paypal_2.png",
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GiftCardButton(
                  text: "",
                  price: "",
                  image: "assets/images/gift/google.png",
                ),
                GiftCardButton(
                  text: "",
                  price: "",
                  image: "assets/images/gift/google.png",
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GiftCardButton(
                  text: "",
                  price: "",
                  image: "assets/images/gift/google.png",
                ),
                GiftCardButton(
                  text: "",
                  price: "",
                  image: "assets/images/gift/google.png",
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GiftCardButton(
                  text: "",
                  price: "",
                  image: "assets/images/gift/google.png",
                ),
                GiftCardButton(
                  text: "",
                  price: "",
                  image: "assets/images/gift/google.png",
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
