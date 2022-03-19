import 'package:bmi_calc/main.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc/constants/app_constants.dart';
import 'package:bmi_calc/utils/routes.dart';
import 'package:bmi_calc/widgets/left_bar.dart';
import 'package:bmi_calc/widgets/right_bar.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool changeButton = false;
  moveToHome(BuildContext context) async {
    setState(() {
      changeButton = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);

    setState(() {
      changeButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: mainHexColor,
      child: Column(
        children: [
          // SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
            child: Column(children: [Image.asset("Images/WelcomeMB.png")]),
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            color: Colors.black,
            borderRadius: BorderRadius.circular(changeButton ? 50 : 15.0),
            child: InkWell(
              onTap: () => moveToHome(context),
              child: AnimatedContainer(
                width: changeButton ? 50 : 150,
                height: 50,
                alignment: Alignment.center,
                duration: const Duration(seconds: 1),
                child: changeButton
                    ? const Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : const Text(
                        "Start",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
              ),
            ),
          ),

          // ElevatedButton.icon(
          //   onPressed: () async {
          //     await Future.delayed(const Duration(seconds: 1));
          //     Navigator.pushNamed(context, MyRoutes.homeRoute);
          //   },
          //   label: const Text(
          //     "Start",
          //     style: TextStyle(fontSize: 20),
          //   ),
          //   icon: const Icon(Icons.start),
          //   style: ElevatedButton.styleFrom(
          //       primary: Colors.black, minimumSize: const Size(120, 50)),
          // ),
          const SizedBox(
            height: 20,
          ),
          const RightBar(barWidth: 40),
          const SizedBox(
            height: 20,
          ),
          const RightBar(barWidth: 140),
          const SizedBox(
            height: 20,
          ),
          const RightBar(barWidth: 60),
          const SizedBox(
            height: 20,
          ),
          const LeftBar(barWidth: 100),
          const SizedBox(
            height: 50,
          ),
          const LeftBar(barWidth: 100),
          // Icon(Icons.start_outlined)
        ],
      ),
    );
  }
}
