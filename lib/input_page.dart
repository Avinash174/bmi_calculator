import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable.dart';
import 'icon_content.dart';
import 'constant.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 0;
  int weight = 0;
  Color malecardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;

  void updateColor(Gender selectGender) {
    if (selectGender == Gender.male) {
      if (malecardColor == inactiveColor) {
        malecardColor = activeCardColor;
        femaleCardColor = inactiveColor;
      } else {
        malecardColor = inactiveColor;
      }
    }
    if (selectGender == Gender.female) {
      if (femaleCardColor == inactiveColor) {
        femaleCardColor = activeCardColor;
        malecardColor = inactiveColor;
      } else {
        femaleCardColor = inactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: Reusable(
                      color: malecardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: Reusable(
                      color: femaleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Reusable(
            color: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: labelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: numberStyle),
                    Text(
                      'cm',
                      style: labelStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x28EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 220.0,
                      thumbColor: Color(0xFFFB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                ),
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Reusable(
                color: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: labelStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: numberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Color(0xFF4C4F5E),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10,),
                        FloatingActionButton(
                          backgroundColor: Color(0xFF4C4F5E),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                child: Reusable(
                  color: activeCardColor,
                  cardChild: Column(),
                ),
              )
            ],
          )),
          Container(
            color: bottomContainerColor,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
