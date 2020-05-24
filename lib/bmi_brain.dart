import 'dart:math';

class BMIBrain {
  BMIBrain({this.weight, this.height});

  final int height;
  final int weight;

  String calculateBMI() {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }
}
