import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:randomdog/utils/extension_height.dart';
import 'package:randomdog/utils/appbar_shape.dart';

class JoinClassView extends StatelessWidget {
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
          title: const Text("Join Class"),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text("Join"),
            ),
          ],
        ),
        Expanded(
            child: ListView(
          children: [
            Card(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("You're currently signed in as"),
                    ),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                      ),
                      title: const Text(
                        "Ye Min Thu",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      subtitle: const Text(
                        "yeminthugtcep@gmail.com",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Switch account"),
                      ),
                    ),
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                  "Ask your teacher for the class code,then enter it here"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Class code",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Text("To sign in with a class code"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text.rich(TextSpan(
                  text: ".",
                  style: TextStyle(fontSize: 40),
                  children: [
                    TextSpan(
                      text: "Use an authorized account",
                      style: TextStyle(fontSize: 14),
                    )
                  ])),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text.rich(
                TextSpan(text: ".", style: TextStyle(fontSize: 40), children: [
                  TextSpan(
                    text:
                        " Use a class code with 6-8 letters or numbers and no spaces or no symbols",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ]),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text("If you have trouble joining the class, got to the")

                // Text.rich(
                //   TextSpan(
                //       text: "If you have trouble joining the class, got to the",
                //       children: [
                //         TextSpan(
                //             text: " Help Center Article",
                //             style: TextStyle(color: Colors.blue)),
                //       ]),
                // ),
                ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 130, vertical: 40),
              child: GestureDetector(
                  onTap: () {},
                  child: const Text("Help Center Article",
                      style: TextStyle(color: Colors.blue))),
            )
          ],
        ))
      ]),
    );
  }
}
