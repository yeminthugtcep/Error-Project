import 'package:get/get.dart';
import 'package:randomdog/controller/setting_report_crashes_controller.dart';

class SettingSwitchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingReportCrashesController());
  }
}
