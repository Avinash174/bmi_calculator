import 'dart:math';
class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi=0;

  String calculateBMI(){
    _bmi=weight /pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return 'Overweight';
    }else if(_bmi>18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
  String getInterpretation(){
    if(_bmi>=25){
      return 'You Have Higher Than Nornal Weight. Try To Exercise More';
  }else if(_bmi>18.5){
      return 'You Have Normal Exercise.Do Regular Exercise And Maintain Yourself';
    }
    else{
      return "You Have A Lower Than Normal Body Weight.You Can Take More Vitamin's And Protein's";
    }
}
}
