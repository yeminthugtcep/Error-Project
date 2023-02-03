import 'package:get/get.dart';
import 'package:randomdog/controller/app_drawer_controller.dart';

class DrawerBinding extends Bindings {
  final String tag;
  DrawerBinding(this.tag);
  @override
  void dependencies() {
    if (Get.isRegistered<AppDrawerController>(tag: tag)) {
      Get.delete<AppDrawerController>(tag: tag);
      //Get.replace(AppDrawerController());
    }
    //Get.lazyPut(() => AppDrawerController());
    Get.put(AppDrawerController(), tag: tag);
  }
}
