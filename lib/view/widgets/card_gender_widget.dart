import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yacka_mobile/core/constant/color.dart';

class cardGender extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String text;
  final Color color;
  final void Function()? ontap;
  const cardGender(
      {Key? key,
      required this.iconData,
      required this.text,
      required this.iconColor,
      required this.color,
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: appColors.backgroundColor, width: 2)),
        alignment: Alignment.center,
        height: Get.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 80,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Color.fromARGB(255, 181, 177, 177),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ));
  }
}
