import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/main.dart';
import 'package:randomdog/screen/home_screen.dart';

///Views::app_drawer_view.dart
class DrawerData {
  final String name;
  final IconData? iconData;
  const DrawerData(this.name, [this.iconData]);
}

const List<DrawerData> toShowList = [
  DrawerData("Classes", Icons.home),
  DrawerData("Calendar", Icons.calendar_today),
  DrawerData("Dart Advance Class"),
  DrawerData("Art Of Flutter"),
  DrawerData("Flutter In Master"),
  DrawerData("Classroom folder", Icons.folder),
  DrawerData("Settings", Icons.settings),
  DrawerData("Send Google feedback", Icons.free_breakfast_outlined),
  DrawerData("Help", Icons.help)
];

class AppDrawerView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width * 0.7,
      color: Colors.white,
      child: Column(children: [
        AppBar(
          title: const Text(APPTITLE),
          automaticallyImplyLeading: false,
        ),
        Expanded(
            child: ListView.separated(
          separatorBuilder: (context, index) {
            switch (index) {
              case 1:
                return const Divider();
              case 4:
                return const Divider();
              default:
                return const SizedBox();
            }
          },
          itemCount: toShowList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                print("home back");
                if (Get.currentRoute == "Classes") {
                  Get.back();
                } else {
                  Get.until((route) => route.settings.name == homeRoute);
                }
              },
              leading: toShowList[index].iconData == null
                  ? CircleAvatar(
                      radius: 12,
                      child: Text(toShowList[index].name[0].toUpperCase()),
                    )
                  : Icon(toShowList[index].iconData),
              title: Text(toShowList[index].name),
            );
          },
        ))
      ]),
    );
  }
}
