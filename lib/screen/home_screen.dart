import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/controller/app_drawer_controller.dart';
import 'package:randomdog/main.dart';
import 'package:randomdog/utils/app_drawer.dart';
import 'package:randomdog/utils/appbar_shape.dart';
import 'package:randomdog/widget/bottom_sheet.dart';
import 'package:randomdog/widget/home/class_room_card.dart';
import 'package:randomdog/widget/home/create_class.dart';
import 'package:randomdog/widget/home/join_class_view.dart';

///Screen::HomeScreen
const String APPTITLE = "Google Class Room Clone";
const List<String> ImageList = [
  "https://img.freepik.com/premium-photo/earth-space-galaxy-milky-way-backdrop-3d-illustration_357568-813.jpg?w=1380",
  "https://img.freepik.com/free-photo/island-seen-from-sea_1286-137.jpg?size=626&ext=jpg&ga=GA1.1.1021140828.1674205632",
  "https://img.freepik.com/free-photo/3d-robot-hand-background-ai-technology-side-view_53876-129789.jpg?size=626&ext=jpg&ga=GA1.1.1021140828.1674205632"
      "https://img.freepik.com/free-photo/pathway-middle-buildings-dark-sky-japan_181624-43078.jpg?size=626&ext=jpg&ga=GA1.1.1021140828.1674205632",
  "https://img.freepik.com/free-photo/ai-nuclear-energy-background-future-innovation-disruptive-technology_53876-129783.jpg?size=626&ext=jpg&ga=GA1.1.1021140828.1674205632",
  "https://img.freepik.com/free-photo/fuji-mountain-with-milky-way-night_335224-104.jpg?size=626&ext=jpg&ga=GA1.1.1021140828.1674205632"
];

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final AppDrawerController appDrawerController =
        Get.find<AppDrawerController>(tag: homeRoute);
    return Scaffold(
      key: appDrawerController.drawerKey,
      drawer: AppDrawerView(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            appDrawerController.OpenDrawer();
          },
        ),
        title: const Text(APPTITLE),
        actions: [
          IconButton(
            onPressed: () {
              showBottomMenu(height: 130, children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.pages),
                    title: const Text("Create Class"),
                    onTap: () {
                      Get.back();
                      Get.bottomSheet(
                        CreateClass(),
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: appBarShape,
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.join_inner),
                    title: const Text("Join Class"),
                    onTap: () {
                      Get.back();
                      Get.bottomSheet(
                        JoinClassView(),
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: appBarShape,
                      );
                    },
                  ),
                )
              ]);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(settingRoute);
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        padding: const EdgeInsets.all(10),
        itemCount: ImageList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(detailRoute);
            },
            child: ClassRoomCard(
                backgroundImage: ImageList[index],
                title: "Cool Title $index",
                preiod: "Preiod $index",
                instructor: "Instructor $index"),
          );
        },
      ),
    );
  }
}
