//import 'package:bmi_calculator/BMI_calculator.dart';
//import 'package:bmi_calculator/layouts/bmi/BMI_calculator.dart';
import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/layouts/home_layout.dart';
import 'package:bmi_calculator/shared/blocObserver.dart';
import 'package:flutter/material.dart';

import 'counter/counter.dart';
void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

   return    MaterialApp(
     debugShowCheckedModeBanner: false,
     home: HomeLayout(),
   );

   }

}
