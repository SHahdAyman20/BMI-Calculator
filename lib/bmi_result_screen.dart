import 'package:bmi_app/colors.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const BMIResultScreen({
    super.key,
    required this.interpretation,
    required this.bmiResult,
    required this.resultText,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF111328),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: activeColour,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "Your Result",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: nonactiveColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // underweight or normal or overweight
                    Text(
                      resultText,
                      style: const TextStyle(
                          color: Color(0xFF00E676),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    // numerical result
                    Text(
                      bmiResult,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                          fontWeight: FontWeight.bold),
                    ),
                    // interpretation statement
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // button navigate me to previous screen to re-calculate
            // throughout navigate.pop() .. tis func delete the recent screen and take me to previous
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              color: pinkColor,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                height: 50.0,
                child: const Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
