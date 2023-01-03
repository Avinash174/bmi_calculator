import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable.dart';
import 'icon_content.dart';


const bottomContainerHeight=80.0;
const activeCardColor=Color(0xFF1D1E33);
const inactiveColor=Color(0xFF111328);
const bottomContainerColor=Color(0xFFEB1555);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardColor=inactiveColor;
  Color femaleCardColor=inactiveColor;

  void updateColor(int gender){
    if(gender==1){
      if(malecardColor==inactiveColor) {
        malecardColor = activeCardColor;
        femaleCardColor=inactiveColor;
      }else{
        malecardColor=inactiveColor;

      }
    }
    if(gender==2){
      if(femaleCardColor==inactiveColor){
        femaleCardColor=activeCardColor;
        malecardColor=inactiveColor;
      }else{
        femaleCardColor=inactiveColor;
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
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: Reusable(
                      color:malecardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(2);
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
            cardChild: Row(
              children: [

              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Reusable(
                color: activeCardColor,
                cardChild: Column(),
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



