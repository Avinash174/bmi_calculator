import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.onTap,required this.buttonTitle});

  final String buttonTitle;
  final  onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle,style: LargeButtonTextStyle,)),
        color: bottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 15.0),
        height: bottomContainerHeight,
      ),
    );
  }
}