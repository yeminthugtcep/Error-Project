import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:randomdog/controller/auth_controller.dart';
import 'package:randomdog/main.dart';
import 'package:randomdog/widget/landing_view.dart';
import 'package:randomdog/widget/multi_login_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Stack(
      alignment: Alignment.center,
      children: [
        LandingView(
          showPrivacyPolicy: false,
          description: "",
          landingChildren: [
            MultiLoginButton(
              buttonIcon: FontAwesomeIcons.facebook,
              buttonName: "Login with facebook",
              buttonOnPressed: () {},
            ),
            MultiLoginButton(
              buttonIcon: FontAwesomeIcons.google,
              buttonName: "Continue with google",
              buttonOnPressed: () {
                authController.loginWithGoogle();
              },
            ),
            MultiLoginButton(
              buttonIcon: FontAwesomeIcons.envelope,
              buttonName: "Continue with email",
              buttonOnPressed: () {
                Get.toNamed(loginWithEmailRoute);
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
        GetBuilder<AuthController>(
          id: "loading",
          builder: (controller) {
            return controller.isLoading
                ? Container(
                    color: Colors.black12,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  )
                : const SizedBox();
          },
        )
      ],
    );
  }
}
