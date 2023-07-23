import 'package:bmi_calculator/Screens/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMI());
}

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePageBMI(),
      debugShowCheckedModeBanner: false,
    );
  }
}

