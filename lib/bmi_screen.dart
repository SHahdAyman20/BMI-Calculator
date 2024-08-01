import 'package:bmi_app/result_functions.dart';
import 'bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {


  bool isMale = false;
  // UI Design
  // (male || female) ,
  // (height 'slider') ,
  // (weight && age) ,
  // (calculate button)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: activeColour,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
              color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: activeColour,
        child: Column(
          children: [
            // this is for gender -> male or female
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    //this for male container
                    Expanded(
                      // GestureDetector to make container clickable
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            //change color depend on male or not
                            color: isMale ? activeColour : nonactiveColour,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              const Image(
                                image: AssetImage('image/male.png'),
                                color: Colors.white,
                                height: 100.0,
                                width: 100.0,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                    fontSize: 20.0,
                                     color:fontColor
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    //this for female icon
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale ? nonactiveColour : activeColour,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              const Image(
                                image: AssetImage('image/female.png'),
                                color: Colors.white,
                                height: 90.0,
                                width: 90.0,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color:fontColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //this for height and slider
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: nonactiveColour,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                            fontSize: 25.0,
                            color:fontColor
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text(
                            '${height.toInt()}',
                            style: const TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'CM',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: fontColor,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: height,
                          max: 220,
                          min: 80,
                          activeColor: pinkColor,
                          inactiveColor: nonactiveColour,
                          // this anonymous function take a value from me when pull the slider and put this value to the height variable
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            //this for age and weight
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: nonactiveColour,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                  fontSize: 25.0,
                                color: fontColor,
                                  ),
                            ),
                            Text(
                              '$weight',
                              style: const TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                FloatingActionButton(
                                  backgroundColor: fontColor,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  mini: true,
                                  heroTag: 'weight--',
                                  child: const Icon(Icons.remove,),
                                ),
                                FloatingActionButton(
                                  backgroundColor: fontColor,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  mini: true,
                                  heroTag: 'weight++',
                                  child: const Icon(Icons.add),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: nonactiveColour,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text(
                              'AGE',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: fontColor,),
                            ),
                            Text(
                              '$age',
                              style: const TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                FloatingActionButton(
                                  backgroundColor: fontColor,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  mini: true,
                                  heroTag: 'age--',
                                  child:  Icon(Icons.remove),
                                ),
                                FloatingActionButton(
                                  backgroundColor: fontColor,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  mini: true,
                                  heroTag: 'age++',
                                  child: const Icon(Icons.add),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //this for calculate button and calculate your bmi and push the value to result screen
            Container(
              width: double.infinity,
              color: pinkColor,
              child: MaterialButton(
                height: 50.0,
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                onPressed: () {
                  // now i called the bmiResult function and passed it to parameters of BMIResultScreen
                  // WHICH take the values of height, weight, and age ... doing functions on these values
                  // like in getResult(), bmiResult(), and getInterpretation() and navigate these values to result screen
                  bmiResult();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMIResultScreen(
                        resultText: getResult(),
                        bmiResult: bmiResult(),
                        interpretation: getInterpretation(),
                      ),
                      )
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
// int x=5;
// if(x %2==0) print('even')
//else print('odd')
// x % 2 == 0 ? ''
