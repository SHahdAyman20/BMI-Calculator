import 'main.dart';
import 'bmi_screen.dart';
import 'package:flutter/material.dart';


class BMIResultScreen extends StatelessWidget {

  final String BmiResult;
  final String resultText;
  final String interpretation;

  BMIResultScreen({
    required this.interpretation,
    required this.BmiResult,
    required this.resultText,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111328),
        title: Text(
          'BMI Calculator',
         style: TextStyle(fontSize: 25,),),
        centerTitle: true,
      ),

      body: Container(
        width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Expanded(child:
              Container(
                padding: EdgeInsets.all(20),
                child:Text("Your Result",
                  style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Colors.white
                  ),),),),
              Expanded(
                flex: 6,
                child: Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  color: Color(0xE51E214B),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[

                     Text(
                       resultText,
                       style: TextStyle(
                         color: Color(0xFF00E676),
                         fontSize:30,
                         fontWeight: FontWeight.bold
                       ),
                     ),

                     Text(
                       BmiResult,
                       style: TextStyle(
                           color: Colors.white,
                           fontSize:100,
                           fontWeight: FontWeight.bold
                       ),
                     ),

                     Text(
                       interpretation,
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           color: Colors.white,
                           fontSize:25,
                       ),
                     ),
                   ],
                 ),
              )

                ),),

              Container(
                  margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                color: Color(0xFFEB1555),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  height: 50.0,
                   child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                    color: Colors.white,
                   fontWeight: FontWeight.bold,
                    fontSize: 25),
                ),)
              ), ],
          ),
        color: Color(0xFF111328),
        ),



    );
  }
}
