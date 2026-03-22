import 'package:get/get.dart';
import '../models/bmi_model.dart';

class BmiController extends GetxController {
  // Observable state
  final Rx<Gender> selectedGender = Gender.male.obs;
  final RxInt height = 170.obs;
  final RxInt weight = 70.obs;
  final RxInt age = 25.obs;

  // Calculated results (stored after calculation)
  final RxString bmiResult = ''.obs;
  final RxString resultLabel = ''.obs;
  final RxString interpretation = ''.obs;
  final RxString resultColorKey = ''.obs;

  void selectGender(Gender gender) {
    selectedGender.value = gender;
  }

  void incrementHeight() {
    if (height.value < 220) height.value++;
  }

  void decrementHeight() {
    if (height.value > 50) height.value--;
  }

  void setHeight(double value) {
    height.value = value.round();
  }

  void incrementWeight() {
    if (weight.value < 300) weight.value++;
  }

  void decrementWeight() {
    if (weight.value > 10) weight.value--;
  }

  void incrementAge() {
    if (age.value < 120) age.value++;
  }

  void decrementAge() {
    if (age.value > 1) age.value--;
  }

  void calculateAndNavigate() {
    final model = BmiModel(
      height: height.value,
      weight: weight.value,
      age: age.value,
      gender: selectedGender.value,
    );

    bmiResult.value = model.calculateBMI();
    resultLabel.value = model.result;
    interpretation.value = model.interpretation;
    resultColorKey.value = model.resultColor;

    Get.toNamed('/result');
  }
}
