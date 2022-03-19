import 'package:bmi_calc/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc/screens/home.dart';
import 'package:bmi_calc/utils/routes.dart';
import 'package:bmi_calc/screens/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainHexColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MyRoutes.startRoute,
      routes: {
        "/": (context) => const StartScreen(),
        MyRoutes.startRoute: (context) => const StartScreen(),
        MyRoutes.homeRoute: (context) => HomeScreen()
      },
    );
  }
}
