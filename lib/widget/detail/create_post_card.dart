import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/main.dart';
import 'package:randomdog/utils/appbar_shape.dart';
import 'package:randomdog/widget/bottom_sheet.dart';
import 'package:randomdog/widget/detail/insert_link.dart';
import 'package:randomdog/widget/detail/select_card.dart';
import 'package:randomdog/utils/extension_height.dart';

///Widget::CreatePostCard
class CreatePostCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.defaultBottomHeight,
      child: Column(
        children: [
          AppBar(
            shape: appBarShape,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Post"),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
            ],
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.all(5),
            children: [
              Theme(
                data: lightTheme.copyWith(
                    elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.teal),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontWeight: FontWeight.w500)),
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.teal.shade100)),
                )),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.3))),
                  child: Row(
                    children: [
                      const Icon(Icons.group),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.bottomSheet(
                            SelectView(
                              title: "Dart Advance Class",
                            ),
                            backgroundColor: Colors.white,
                            isScrollControlled: true,
                            shape: appBarShape,
                          );
                        },
                        child: const Text("Dart Advance Class"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.bottomSheet(
                            SelectView(
                              title: "All Students",
                            ),
                            backgroundColor: Colors.white,
                            isScrollControlled: true,
                            shape: appBarShape,
                          );
                        },
                        child: const Text("All Students"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.3))),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, right: 20),
                        child: Icon(Icons.notes),
                      ),
                      Expanded(
                          child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                            hintText: "Share with your class",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      )),
                    ]),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.3))),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        child: GestureDetector(
                            onTap: AddLink, child: const Icon(Icons.link)),
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 0.3))),
                            child: Row(children: [
                              Expanded(
                                  child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Icon(Icons.link),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "https://google.com",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  const Spacer(),
                                  // ignore: prefer_const_constructors
                                  IconButton(
                                      onPressed: Delete,
                                      icon: const Icon(Icons.more_vert_rounded))
                                ],
                              ))
                            ]),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 0.3))),
                            child: Row(children: [
                              Expanded(
                                  child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Icon(Icons.file_copy),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "https://google.com",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  const Spacer(),
                                  const IconButton(
                                      onPressed: Delete,
                                      icon: Icon(Icons.more_vert_rounded))
                                ],
                              ))
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: GestureDetector(
                              onTap: AddLink,
                              child: const Text(
                                "Add attchment",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ]),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

AddLink() async {
  await showBottomMenu(height: 130, children: [
    Card(
      child: ListTile(
        onTap: () async {
          Get.back();
          await Get.dialog(InsertLink());
        },
        leading: const Icon(Icons.link),
        title: const Text("Insert link"),
      ),
    ),
    Card(
      child: ListTile(
        onTap: () {
          Get.back();
        },
        leading: const Icon(Icons.upload),
        title: const Text("Upload file"),
      ),
    ),
  ]);
}

Delete() async {
  await showBottomMenu(height: 60, children: [
    ListTile(
      onTap: () {
        Get.back();
      },
      leading: const Icon(Icons.delete),
      title: const Text("Remove attachment"),
    )
  ]);
}
