import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/main.dart';
import 'package:randomdog/utils/button_shape.dart';
import 'package:randomdog/widget/landing_view.dart';

class LandingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return LandingView(
        description: "Let's discover & learn it",
        showPrivacyPolicy: true,
        landingChildren: [
          Container(
            //margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            width: context.width,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(buttonShape),
              ),
              onPressed: () {
                Get.toNamed(registorRoute);
              },
              child: const Text("Registor"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            width: context.width,
            child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(buttonShape),
              ),
              onPressed: () {
                Get.toNamed(loginRoute);
              },
              child: const Text("Sign In"),
            ),
          ),
        ]);
  }
}
