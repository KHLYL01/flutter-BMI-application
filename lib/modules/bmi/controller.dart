import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxBool isMale = true.obs;
  RxDouble height = 160.0.obs;
  RxInt weight = 60.obs;
  RxInt age = 20.obs;

  toMale() {
    if (!isMale.value) {
      isMale.value = true;
    }
  }

  toFemale() {
    if (isMale.value) {
      isMale.value = false;
    }
  }

  increaseAge() {
    age.value++;
  }

  decreaseAge() {
    age.value--;
  }

  increaseWeight() {
    weight.value++;
  }

  decreaseWeight() {
    weight.value--;
  }

  double calculate() {
    return (weight.value / pow(height.value / 100, 2));
  }

  String bmiState() {
    double c = calculate();
    if (c < 18.5) {
      return 'Underweight';
    } else if (c >= 18.5 && c < 25) {
      return 'Normal';
    } else if (c >= 25 && c < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color bmiStateColor() {
    double c = calculate();
    if (c < 18.5) {
      return Colors.red;
    } else if (c >= 18.5 && c < 25) {
      return Colors.green;
    } else if (c >= 25 && c < 30) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
