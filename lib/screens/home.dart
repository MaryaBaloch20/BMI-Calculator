import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc/widgets/left_bar.dart';
import 'package:bmi_calc/widgets/right_bar.dart';
import 'package:bmi_calc/constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: mainHexColor,
          ),
        ),
        backgroundColor: accentHexColor,
        elevation: 30,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // color: Colors.black,
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        // border: const OutlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.red),
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 40,
                            color: Colors.white.withOpacity(.8),
                            fontWeight: FontWeight.bold)
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 40,
                            color: Colors.white.withOpacity(.8),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "You\'re over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You have normal weight";
                  } else {
                    _textResult = "You\'re under weight";
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: accentHexColor,
                minimumSize: const Size(100, 80),
                elevation: 20,
              ),
              child: const Text(
                "Calculate",
                style: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 38,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: const TextStyle(
                    color: accentHexColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 100),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: const TextStyle(
                      color: accentHexColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
            // Visibility(
            //   visible: _textResult.isNotEmpty,
            //   child: ElevatedButton(onPressed: onPressed, child: child)
            // ),

            const SizedBox(
              height: 70,
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
            const SizedBox(
              height: 20,
            ),
            // LeftBar(barWidth: 220),
          ],
        ),
      ),
    );
  }
}
