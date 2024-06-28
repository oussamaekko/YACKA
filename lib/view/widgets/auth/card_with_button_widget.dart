import 'package:flutter/material.dart';
import 'package:yacka_mobile/core/constant/color.dart';

import 'package:get/get.dart';

class CardWithButton extends StatelessWidget {
  final String text;
  final String textType;
  final String type;
  final void Function() onPressed1;
  final void Function() onPressed2;

  const CardWithButton(
      {Key? key,
      required this.text,
      required this.textType,
      required this.type,
      required this.onPressed1,
      required this.onPressed2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: appColors.cardHeightColor,
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      height: Get.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textType,
                style: const TextStyle(
                    color: appColors.primaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                type,
                textAlign: TextAlign.justify,
                style: const TextStyle(color: appColors.primaryColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onPressed1,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(40, 40),
                  primary: appColors.backgroundColor,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(0),
                ),
                child: const Icon(
                  Icons.remove,
                  size: 30,
                  color: appColors.primaryColor,
                ),
              ),
              ElevatedButton(
                onPressed: onPressed2,
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(40, 40),
                    primary: appColors.backgroundColor,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(0)),
                child: const Icon(
                  Icons.add_rounded,
                  color: appColors.primaryColor,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
