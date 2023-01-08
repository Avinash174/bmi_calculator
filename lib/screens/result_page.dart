import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/reusable.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult,required this.interpretation,required this.resultext});

  final String bmiResult;
  final String resultext;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Your Results',
                  style: titleText,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusable(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultext.toUpperCase(),
                    style: resultText,
                  ),
                  Text(
                    bmiResult,
                    style: BMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: BodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(onTap: () {
            Navigator.pop(context);
          },
              buttonTitle: 'RECALCULATE'
          ),
        ],
      ),
    );
  }
}
