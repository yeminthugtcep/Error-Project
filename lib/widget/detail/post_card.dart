import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/widget/bottom_sheet.dart';
import 'package:randomdog/widget/detail/anmous_card.dart';

///Widget::PostCard
class PostCard extends StatelessWidget {
  final String profileImage, userName, createDate, description;
  PostCard(
      {required this.profileImage,
      required this.userName,
      required this.createDate,
      required this.description});
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(children: [
        ListTile(
          onTap: () {},
          leading: Container(
            height: 40,
            width: 40,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: profileImage,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(userName),
          subtitle: Text(createDate),
          trailing: IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () async {
              await showBottomMenu(height: 130, children: [
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.back();
                      createLesson();
                    },
                    leading: const Icon(Icons.edit),
                    title: const Text("Edit"),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.delete_forever_outlined),
                    title: const Text("Delete"),
                  ),
                ),
              ]);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
          child: Text(
            description,
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 15, height: 1.4),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 0.2))),
          child: const Text(
            "Add class comment",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ]),
    );
  }
}
