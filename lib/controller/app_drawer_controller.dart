import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///Controller::AppDrawerController
class AppDrawerController extends GetxController {
  final drawerKey = GlobalKey<ScaffoldState>();

  void OpenDrawer() {
    print("open drawer");

    drawerKey.currentState?.openDrawer();
  }

  void CloseDrawer() {
    drawerKey.currentState?.closeDrawer();
  }

  onClose() {
    drawerKey.currentState?.dispose();
    super.onClose();
  }
}
