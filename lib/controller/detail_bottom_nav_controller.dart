import 'package:get/get.dart';

class DetailBottomNavController extends GetxController {
  int index = 0;
  void ChangeBottomNav(int value) {
    index = value;
    update(["bottomView"]);
  }
}
