import 'package:bmi_plus/HomePage.dart';
//import 'package:bmi_plus/MalePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(bmiPlus());
}

class bmiPlus extends StatelessWidget {
  const bmiPlus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : HomePage()
    );
  }
}
