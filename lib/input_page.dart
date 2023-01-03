import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  child: new Reusable(
                    color: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
              child: new Reusable(
            color: Color(0xFF1D1E33),
            cardChild: Column(

            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: new Reusable(
                color: Color(0xFF1D1E33),
                cardChild: Column(),
              )),
              Expanded(
                child: new Reusable(
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

class Reusable extends StatelessWidget {
  Reusable({required this.color, required this.cardChild});
  final Color color;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
