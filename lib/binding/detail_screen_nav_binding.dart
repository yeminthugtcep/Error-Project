import 'package:get/get.dart';
import 'package:randomdog/controller/detail_bottom_nav_controller.dart';

class DetailScreenNavBinding extends Bindings {
  @override
  void dependencies() {
    if (Get.isRegistered<DetailBottomNavController>()) {
      Get.delete<DetailBottomNavController>();
    }
    Get.lazyPut(() => DetailBottomNavController());
  }
}
