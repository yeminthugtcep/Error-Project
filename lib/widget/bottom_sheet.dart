import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future showBottomMenu(
    {required double height, required List<Widget> children}) {
  return Get.bottomSheet(BottomMenu(
    height: height,
    children: children,
  ));
}

class BottomMenu extends StatelessWidget {
  final double height;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  BottomMenu(
      {required this.height,
      required this.children,
      this.crossAxisAlignment = CrossAxisAlignment.center});
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: context.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(crossAxisAlignment: crossAxisAlignment, children: children),
    );
  }
}
