import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  child: Reusable(
                    color: Color(0xFF1D1E33),
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    color: Color(0xFF1D1E33),
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Reusable(
            color: Color(0xFF1D1E33),
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
                color: Color(0xFF1D1E33),
                cardChild: Column(),
              )),
              Expanded(
                child: Reusable(
                  color: Color(0xFF1D1E33),
                  cardChild: Column(),
                ),
              )
            ],
          )),
          Container(
            color: Color(0xFFEB1555),
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
            height: 80.0,
          ),
        ],
      ),
    );
  }
}



