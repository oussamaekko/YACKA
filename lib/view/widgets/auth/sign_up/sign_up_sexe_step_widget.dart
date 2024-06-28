import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yacka_mobile/model/sexe.dart';
import 'package:yacka_mobile/view/widgets/card_gender_widget.dart';
import 'package:yacka_mobile/core/constant/color.dart';

class SignUpSexStep extends StatefulWidget {
  SignUpSexStep({super.key, required this.sexe, required this.onSexeChanged});

  Sexe sexe = Sexe(idSexe: 0, libelle: '');
  final ValueChanged<Sexe> onSexeChanged;

  @override
  State<SignUpSexStep> createState() => _SignUpSexStepState();
}

class _SignUpSexStepState extends State<SignUpSexStep> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Sexe",
              style: TextStyle(
                fontSize: 15,
              )),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Row(
            children: [
              cardGender(
                text: "MALE",
                iconData: Icons.male_rounded,
                iconColor: appColors.iconMaleColor,
                color: widget.sexe.libelle == 'MALE'
                    ? appColors.buttonCardClickBackground
                    : Colors.transparent,
                ontap: () {
                  // controller.changeGenderCardColor();
                  setState(() {
                    widget.onSexeChanged(Sexe(idSexe: 1, libelle: 'MALE'));
                  });
                },
              ),
              const SizedBox(width: 10),
              cardGender(
                text: "FEMALE",
                iconData: Icons.female_rounded,
                iconColor: appColors.iconFemaleColor,
                // color: controller.backgroundCardGenderFemale,
                color: widget.sexe.libelle == 'FEMALE'
                    ? appColors.buttonCardClickBackground
                    : Colors.transparent,
                ontap: () {
                  // controller.changeGenderColorFemale();
                  setState(() {
                    widget.onSexeChanged(Sexe(idSexe: 2, libelle: 'FEMALE'));
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
