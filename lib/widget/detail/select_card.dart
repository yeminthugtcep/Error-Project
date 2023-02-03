import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/utils/extension_height.dart';
import 'package:randomdog/utils/appbar_shape.dart';

class SelectView extends StatelessWidget {
  final String title;
  SelectView({required this.title});
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.defaultBottomHeight,
      child: Column(children: [
        AppBar(
          shape: appBarShape,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(title),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text("Done"),
            ),
          ],
        ),
        Expanded(
            child: ListView(
          padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
          children: [
            if (title == "Dart Advance Class") ...[
              SelectCard(
                title: "Class",
                subtitle: "Dart Advance Class",
                tileColor: Colors.grey.shade200,
              ),
              for (int i = 0; i < 20; i++)
                SelectCard(
                  title: "Dart Advance Class",
                  subtitle: "Dart Advance Class",
                  //leading: const Icon(Icons.group),
                )
            ] else ...[
              SelectCard(
                title: "All Students",
                subtitle: "",
                leading: const Icon(
                  Icons.group_outlined,
                ),
                tileColor: Colors.grey.shade200,
              ),
              for (int i = 0; i < 20; i++)
                SelectCard(
                  title: "Dart Advance Class",
                  subtitle: "Dart Advance Class",
                  //leading: const Icon(Icons.group),
                ),
            ]
          ],
        ))
      ]),
    );
  }
}

class SelectCard extends StatelessWidget {
  final String title, subtitle;
  final Widget? leading;
  final Color? tileColor;

  SelectCard(
      {required this.title,
      required this.subtitle,
      this.leading,
      this.tileColor = Colors.grey});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: ListTile(
        leading: leading ??
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade400,
              child: Text(title[0].toUpperCase()),
            ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.black38, fontSize: 18),
        ),
        subtitle: subtitle.isEmpty
            ? null
            : Text(
                subtitle,
                style: const TextStyle(color: Colors.black38, fontSize: 16),
              ),
        tileColor: tileColor,
        dense: subtitle.isEmpty,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), bottomLeft: Radius.circular(50))),
      ),
    );
  }
}
