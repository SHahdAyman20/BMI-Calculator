import 'dart:math';

import 'package:flutter/material.dart';


var result;
double height = 180;
int weight = 40;
int age = 15;

//calculate BMI
String BmiResult() {
  result = weight / pow(height / 100, 2);
  return result.toStringAsFixed(1);
}
// check BMI result and print your BMI rate
String getResult() {
  if (result >= 25) {
    return 'Overweight 🤦‍♀️😥';
  } else if (result > 18.5) {
    return 'Normal 👌';
  } else {
    return 'Underweight 😶';
  }
}
// print statement which describe your state and advice
String getInterpretation() {
  if (result >= 25) {
    return 'You have a higher than normal body weight. Try to exercise more.\n ❤🏃🚲';
  } else if (result >= 18.5) {
    return 'You have a normal body weight. Good job!\n ❤🍇';
  } else {
    return 'You have a lower than normal body weight. You can eat a bit more.\n 🍕🍔🍟🍎';
  }
}


