import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class GenderRegionController extends GetxController {
  calculate();
  changeProgr(double index);
  changeGenderCardColor();
  changeGenderColorFemale();
}

class GenderRegionControllerImp extends GenderRegionController {
  double changeProg = 0;
  double changeHeight = 1;
  late String gender = "Male";

  Color backgroundCardGenderMale = const Color.fromARGB(255, 30, 32, 63);
  Color backgroundCardGenderFemale = const Color.fromARGB(255, 30, 32, 63);
  int weight = 10;
  int age = 10;
  @override
  calculate() {}

  @override
  changeProgr(double index) {
    changeProg = 0 + index;
    changeHeight = index * 200;
    update();
  }

  incremntWeight() {
    weight++;
    update();
  }

  decerementWeight() {
    weight--;
    update();
  }

  incremntAge() {
    age++;
    update();
  }

  decerementAge() {
    age--;
    update();
  }

  @override
  changeGenderColorFemale() {
    if (backgroundCardGenderFemale == const Color.fromARGB(255, 31, 34, 82)) {
      backgroundCardGenderFemale = const Color.fromARGB(255, 30, 32, 63);
      backgroundCardGenderMale = const Color.fromARGB(255, 31, 34, 82);
    } else {
      backgroundCardGenderFemale = const Color.fromARGB(255, 31, 34, 82);
      backgroundCardGenderMale = const Color.fromARGB(255, 30, 32, 63);
    }
    gender = "Male";
    update();
  }

  @override
  changeGenderCardColor() {
    if (backgroundCardGenderMale == const Color.fromARGB(255, 31, 34, 82)) {
      backgroundCardGenderMale = const Color.fromARGB(255, 30, 32, 63);
      backgroundCardGenderFemale = const Color.fromARGB(255, 31, 34, 82);
    } else {
      backgroundCardGenderMale = const Color.fromARGB(255, 31, 34, 82);
      backgroundCardGenderFemale = const Color.fromARGB(255, 30, 32, 63);
    }
    gender = "female";
    update();
  }
}
