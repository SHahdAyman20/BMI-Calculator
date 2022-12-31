import 'dart:math';
import 'bmi_result_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

class BmiScreen extends StatefulWidget {
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  //calculate bmi
  String BmiResult() {
    result = weight / pow(height / 100, 2);
    return result.toStringAsFixed(1);
  }
 // check bmi result and print your bmi rate
  String getResult() {
    if (result >= 25) {
      return 'Overweight 🤦‍♀️😥';
    } else if (result > 18.5) {
      return 'Normal 👌';
    } else {
      return 'Underweight 😶';
    }
  }
 // print statement which describe your state and advice
  String getInterpretation() {
    if (result >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.\n ❤🏃🚲';
    } else if (result >= 18.5) {
      return 'You have a normal body weight. Good job!\n ❤🍇';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.\n 🍕🍔🍟🍎';
    }
  }




  var result;
  bool isMale = true;
  double height = 180;
  int weight = 40;
  int age = 15;
  Color activeColour = Color(0xFF111328);
  Color nonactiveColour = Color(0xE51E214B);//
  Color bottomContainerColour = Color(0xFFEB1555);
  Color fontColor=Color(0xFF757575);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: activeColour,
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(

          //4 part (male || female) ,(height 'slider') ,(weight && age) , (calculate button)
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    //ex1 for male && SB for space between male,fe && ex2 for fe
                    //this for male icon
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage('image/male.png'),
                                color: Colors.white,
                                height: 100.0,
                                width: 100.0,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                    fontSize: 20.0,
                                     color:fontColor ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale ? activeColour : nonactiveColour,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage('image/female.png'),
                                color: Colors.white,
                                height: 90.0,
                                width: 90.0,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color:fontColor),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale ? nonactiveColour : activeColour,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //this for hight and slider
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                            fontSize: 25.0,
                            color:fontColor ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'CM',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: fontColor),
                          ),
                        ],
                      ),
                      Slider(
                          value: height,
                          max: 220,
                          min: 80,
                          activeColor: bottomContainerColour,
                          inactiveColor: nonactiveColour,

                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          })
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: nonactiveColour),
                ),
              ),
            ),
            //this for age and weight
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: nonactiveColour),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                  fontSize: 25.0,
                                color: fontColor
                                  ),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                  ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FloatingActionButton(
                                  backgroundColor: fontColor,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.remove,),
                                  heroTag: 'weight--',
                                ),
                                FloatingActionButton(
                                  backgroundColor: fontColor,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.add),
                                  heroTag: 'weight++',
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: nonactiveColour),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: fontColor),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),


                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FloatingActionButton(
                                  backgroundColor: fontColor,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.remove),
                                  heroTag: 'age--',
                                ),
                                FloatingActionButton(
                                  backgroundColor: fontColor,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.add),
                                  heroTag: 'age++',
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
            //this for calculate button and calculate your bmi and push to result screen
            Container(
              width: double.infinity,
              color: bottomContainerColour,
              child: MaterialButton(
                onPressed: () {
                   result = weight / pow(height / 100, 2);
                    result.toStringAsFixed(1);
                 // print(result.roundToDouble());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BMIResultScreen(
                        resultText: getResult(),
                        BmiResult: BmiResult(),
                        interpretation: getInterpretation(),)));
                },
                height: 50.0,
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            )
          ],
        ),
        color: activeColour,
      ),
    );
  }
}
