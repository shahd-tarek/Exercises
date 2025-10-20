import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xffBBF246);
const kTextColor = Color(0xff192126);
const kBackground = Color(0xffF5F5F5);

String getMuscleImage(String muscle) {
  switch (muscle.toLowerCase()) {
    case 'abdominals':
      return 'assets/images/biceps.jpg';
    case 'abductors':
      return 'assets/images/chest.jpg';
    case 'adductors':
      return 'assets/images/legs.jpg';
    case 'biceps':
      return 'assets/images/default.jpg';
    case 'calves':
      return 'assets/images/calves.jpg';
    case 'chest':
      return 'assets/images/lats.jpg';
    case 'forearms':
      return 'assets/images/neck.jpg';
    case 'glutes':
      return 'assets/images/traps.jpg';
    case 'hamstrings':
      return 'assets/images/biceps.jpg';
    case 'lats':
      return 'assets/images/chest.jpg';
    case 'lower_back':
      return 'assets/images/legs.jpg';
    case 'middle_back':
      return 'assets/images/default.jpg';
    case 'neck':
      return 'assets/images/calves.jpg';
    case 'quadriceps':
      return 'assets/images/lats.jpg';
    case 'traps':
      return 'assets/images/neck.jpg';
    case 'triceps':
      return 'assets/images/traps.jpg';
    case 'shoulders':
      return 'assets/images/biceps.jpg';
    default:
      return 'assets/images/chest.jpg';
  }
}
