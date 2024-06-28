import 'package:flutter/material.dart';
import 'package:yacka_mobile/core/constant/color.dart';

class LoginInput extends StatelessWidget {
  LoginInput({
    Key? key,
    required this.label,
    this.suffixx = false,
  }) : super(key: key);
  final String label;
  bool suffixx;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width * 0.90,
      height: 60,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 30),
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: suffixx == true
                  ? const Icon(
                      Icons.remove_red_eye_outlined,
                    )
                  : null,
            ),
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              color: appColors.subtitle,
              fontFamily: 'Roboto',
            )),
      ),
    );
  }
}
