import 'package:get/get.dart';

class SettingReportCrashesController extends GetxController {
  bool isOpen = false;

  void swichChange(bool value) {
    isOpen = value;
    update(["switch"]);
  }
}
