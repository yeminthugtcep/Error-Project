import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:randomdog/controller/setting_report_crashes_controller.dart';
import 'package:randomdog/main.dart';

class SettingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Done"),
          ),
        ],
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: const Text("Account Settings"),
              subtitle:
                  const Text("Update your photo, password, language and more"),
              trailing: IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {},
              ),
            ),
          ),
          if (Get.previousRoute == detailRoute)
            ListTile(
              title: const Text("Change name"),
              subtitle:
                  const Text("To change your name, as your admin. Learn more"),
              trailing: IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {},
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: const Text("Notifications"),
              subtitle: const Text(
                  "Choose which one you get on this device and by email"),
              trailing: IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {},
              ),
            ),
          ),
          ListTile(
            title: const Text("Default apps"),
            trailing: IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
                title: const Text("Report crashes"),
                subtitle: const Text(
                    "Update your photo, password, language and more"),
                trailing: GetBuilder<SettingReportCrashesController>(
                  id: "switch",
                  builder: (switchController) {
                    return SizedBox(
                      width: 50,
                      height: 30,
                      child: FlutterSwitch(
                        toggleSize: 30,
                        padding: 1,
                        value: switchController.isOpen,
                        onToggle: (value) {
                          switchController.swichChange(value);
                        },
                      ),
                    );
                  },
                )),
          ),
          ListTile(
            title: const Text("Google usage id"),
            trailing: IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: const Text("About"),
              trailing: IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {},
              ),
            ),
          )
        ]),
      ),
    );
  }
}
