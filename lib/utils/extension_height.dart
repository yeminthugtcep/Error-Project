import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

extension CustomBuildContext on BuildContext {
  double get defaultBottomHeight =>
      (height * 0.95) - mediaQuery.viewInsets.bottom;
}
