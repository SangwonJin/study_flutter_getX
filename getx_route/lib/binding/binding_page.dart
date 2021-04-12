import 'package:get/get.dart';
import '../controller/count_controller_with_getx.dart';

class BindingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CountControllerWithGetX());
  }
}
