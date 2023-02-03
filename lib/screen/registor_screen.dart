import 'package:flutter/material.dart';
import 'package:randomdog/controller/auth_controller.dart';
import 'package:randomdog/main.dart';
import 'package:randomdog/utils/button_shape.dart';
import 'package:randomdog/widget/landing_view.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  final String loginDescription, buttonName;
  AuthScreen({required this.loginDescription, required this.buttonName});
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Form(
      key: authController.authForm,
      child: LandingView(
        description: loginDescription,
        showPrivacyPolicy: true,
        landingChildren: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: authController.email,
              validator: (value) =>
                  value?.isEmail == true ? null : "Invaild email",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onEditingComplete: authController.focusNode.requestFocus,
              decoration: const InputDecoration(
                hintText: "Email",
                contentPadding:
                    EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
            child: TextFormField(
              controller: authController.password,
              obscureText: true,
              validator: (value) => (value?.length ?? 0) >= 6 == true
                  ? null
                  : "Password must be least 6 char",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: authController.focusNode,
              decoration: const InputDecoration(
                hintText: "Password",
                contentPadding:
                    EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 50,
            width: context.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () {
                  if (Get.currentRoute == loginRoute) {
                    authController.login();
                  } else {
                    authController.registor();
                  }
                },
                style:
                    ButtonStyle(shape: MaterialStateProperty.all(buttonShape)),
                child: GetBuilder<AuthController>(
                  id: 'loading',
                  builder: (controller) {
                    return controller.isLoading
                        ? const CircularProgressIndicator()
                        : Text(buttonName);
                  },
                )),
          ),
        ],
      ),
    );
  }
}
