import 'package:flutter/material.dart';

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
          Expanded(child: Row(
            children: [
              Expanded(child: new Reusable(color: Color(0xFF1D1E33),),),
              Expanded(child:Container(

                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(10.0),
                  )
              ),),
            ],
          ),),
          Expanded(child: new Reusable(color: Color(0xFF1D1E33),)),
          Expanded(child: Row(
            children: [
              Expanded(child: new Reusable(color: Color(0xFF1D1E33),)),
              Expanded(child: new Reusable(color: Color(0xFF1D1E33)),
              )],
          )),
          Container(
            color: Color(0xFFEB1555),
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
            height: 80.0   ,
          ),
        ],
      ),

    );
  }
}
class Reusable extends StatelessWidget {
   Reusable({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
