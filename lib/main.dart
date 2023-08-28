//import 'package:bmi_calculator/BMI_calculator.dart';
//import 'package:bmi_calculator/layouts/bmi/BMI_calculator.dart';
import 'package:bmi_calculator/layouts/home_layout.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

   return  const MaterialApp(
     debugShowCheckedModeBanner: false,
     home: HomeLayout(),);

  }

}
