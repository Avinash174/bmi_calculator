import 'dart:math';

enum Gender { male, female }

class BmiModel {
  final int height;
  final int weight;
  final int age;
  final Gender gender;

  double? _bmi;

  BmiModel({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String get result {
    if (_bmi == null) return '';
    if (_bmi! >= 30) return 'Obese';
    if (_bmi! >= 25) return 'Overweight';
    if (_bmi! >= 18.5) return 'Normal';
    return 'Underweight';
  }

  String get interpretation {
    if (_bmi == null) return '';
    if (_bmi! >= 30) {
      return 'Your BMI indicates obesity. Please consult a healthcare professional for a tailored health plan.';
    } else if (_bmi! >= 25) {
      return 'You are slightly above the healthy range. Regular exercise and a balanced diet can help you reach your goal.';
    } else if (_bmi! >= 18.5) {
      return 'Great news! You have a healthy BMI. Keep up your good habits with regular exercise and a balanced diet.';
    } else {
      return 'You are slightly below the healthy range. Consider consulting a nutritionist for a personalised meal plan.';
    }
  }

  String get resultColor {
    if (_bmi == null) return 'normal';
    if (_bmi! >= 30) return 'obese';
    if (_bmi! >= 25) return 'overweight';
    if (_bmi! >= 18.5) return 'normal';
    return 'underweight';
  }
}
