import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftCardButton extends StatelessWidget {
  GiftCardButton({
    Key? key,
    required this.text,
    required this.price,
    required this.image,
  }) : super(key: key);
  String text = "Pay with Google Play";
  String price = "30 \$";
  String image = "assets/images/gift/google.png";

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
          height: Get.height * 0.2,
          alignment: Alignment.center,
          width: Get.width * 0.4,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("$image"),
              )),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // color: Colors.black,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Text("Pay with Google Play",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              // SizedBox(height: 10),
              Text("30 \$",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ],
          )),
    );
  }
}
