import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/controller/app_drawer_controller.dart';
import 'package:randomdog/controller/detail_bottom_nav_controller.dart';
import 'package:randomdog/main.dart';
import 'package:randomdog/utils/app_drawer.dart';
import 'package:randomdog/widget/detail/anmous_card.dart';
import 'package:randomdog/widget/detail/detail_bottom_nav/detail_screen_lession_view.dart';
import 'package:randomdog/widget/detail/detail_bottom_nav/detail_screen_people_view.dart';
import 'package:randomdog/widget/detail/post_card.dart';
import 'package:randomdog/widget/detail/subject_card.dart';

///Screen::DetailScreen
class DetailScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final controller = Get.find<AppDrawerController>(tag: detailRoute);
    return Scaffold(
      key: controller.drawerKey,
      drawer: AppDrawerView(),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            controller.OpenDrawer();
          },
        ),
        centerTitle: true,
        title: GetBuilder<DetailBottomNavController>(
          id: "bottomView",
          builder: (bottomController) {
            return bottomController.index == 0
                ? const SizedBox()
                : const Text("Dart Advance Class");
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(settingRoute);
            },
            icon: GetBuilder<DetailBottomNavController>(
              id: "bottomView",
              builder: (bottomController) {
                return bottomController.index == 0
                    ? const Icon(Icons.settings)
                    : const Icon(Icons.dashboard);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<DetailBottomNavController>(
        builder: (bottomController) {
          return BottomNavigationBar(
              currentIndex: bottomController.index,
              onTap: (value) {
                bottomController.ChangeBottomNav(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat), label: "Stream"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.group), label: "People"),
              ]);
        },
      ),
      body: GetBuilder<DetailBottomNavController>(
          id: "bottomView",
          builder: (bottomController) {
            return [
              DetailScreenLessionView(),
              DetailScreenPeopleView(),
            ][bottomController.index];
          }),
    );
  }
}
