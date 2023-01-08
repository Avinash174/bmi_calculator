import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/reusable.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

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
          Expanded(
            child: Text(
              'Your Results',
              style: titleText,
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
                    'Normal',
                    style: resultText,
                  ),
                  Text(
                    '18.3',
                    style: BMITextStyle,
                  ),
                  Text(
                    'Your BMI Level Is Quite Low, You Should Eat More ',
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
