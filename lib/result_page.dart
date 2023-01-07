import 'package:bmi_calculator/reusable.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Text('Normal',style: resultText,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
