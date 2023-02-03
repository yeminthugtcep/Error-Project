import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/utils/button_shape.dart';

class MultiLoginButton extends StatelessWidget {
  final String buttonName;
  final IconData buttonIcon;
  final void Function()? buttonOnPressed;
  MultiLoginButton(
      {required this.buttonIcon,
      required this.buttonName,
      required this.buttonOnPressed});
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 50,
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: OutlinedButton(
        onPressed: buttonOnPressed,
        style: ButtonStyle(shape: MaterialStateProperty.all(buttonShape)),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(buttonIcon),
            const SizedBox(width: 20),
            Text(buttonName)
          ],
        ),
      ),
    );
  }
}
