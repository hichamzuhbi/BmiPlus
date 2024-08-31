import 'package:bmi_plus/MfPage.dart';
import 'package:bmi_plus/color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Card2(
            gender: "Male".toUpperCase(),
            genderColor: cGrenn,
            gendericon: Icons.male,
            isMale: true,
          ),
          Card2(
            gender: "Female".toUpperCase(),
            genderColor: cPink,
            gendericon: Icons.female,
            isMale: false,
          ),
        ],
      )),
    );
  }
}

// ignore: must_be_immutable
class Card2 extends StatelessWidget {
  String gender;
  Color genderColor;
  IconData gendericon;
  bool isMale;
  Card2({
    super.key,
    required this.gender,
    required this.genderColor,
    required this.gendericon,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: genderColor),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MfPage(
                  isMale: isMale,
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                gendericon,
                size: 80,
                color: Colors.white,
              ),
              Text(
                gender,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
