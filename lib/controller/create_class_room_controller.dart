import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateClassController extends GetxController {
  final className = TextEditingController();
  final section = TextEditingController();
  final room = TextEditingController();
  final subject = TextEditingController();

  bool fillClassName = false;

  final createKey = GlobalKey<FormState>();
  void CheckCanBeCreate() {
    fillClassName = className.text.isNotEmpty;
    update(['create']);
  }

  void onClose() {
    className.dispose();
    section.dispose();
    room.dispose();
    subject.dispose();
    createKey.currentState?.dispose();
    super.onClose();
  }
}
