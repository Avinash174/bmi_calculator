import 'package:get/get.dart';
import '../controllers/bmi_controller.dart';

class BmiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BmiController>(() => BmiController());
  }
}
