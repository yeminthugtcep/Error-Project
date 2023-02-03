import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/controller/create_class_room_controller.dart';
import 'package:randomdog/utils/extension_height.dart';

class CreateClass extends StatelessWidget {
  Widget build(BuildContext context) {
    Get.lazyPut(() => CreateClassController());
    final controllerKey = Get.find<CreateClassController>();
    return Container(
      height: context.defaultBottomHeight,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Get.back();
              },
            ),
            title: const Text("Create Class"),
            centerTitle: true,
            actions: [
              GetBuilder<CreateClassController>(
                id: "create",
                builder: (controller) {
                  return TextButton(
                    onPressed: controller.fillClassName ? () {} : null,
                    child: const Text("Create"),
                  );
                },
              )
            ],
          ),
        ),
        Expanded(
            child: Form(
          key: controllerKey.createKey,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              TextFormField(
                controller: controllerKey.className,
                validator: (value) =>
                    value?.isNotEmpty == true ? null : "required Class Name",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) => controllerKey.CheckCanBeCreate(),
                decoration: const InputDecoration(
                    labelText: "Class Name", hintText: "Class Name"),
              ),
              TextFormField(
                controller: controllerKey.section,
                validator: (value) =>
                    value?.isNotEmpty == true ? null : "required Section",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    labelText: "Section", hintText: "Section"),
              ),
              TextFormField(
                controller: controllerKey.room,
                validator: (value) =>
                    value?.isNotEmpty == true ? null : "required Room",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration:
                    const InputDecoration(labelText: "Room", hintText: "Room"),
              ),
              TextFormField(
                controller: controllerKey.subject,
                validator: (value) =>
                    value?.isNotEmpty == true ? null : "required Subject",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    labelText: "Subject", hintText: "Subject"),
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
