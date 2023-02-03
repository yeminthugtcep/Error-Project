import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingView extends StatelessWidget {
  final String description;
  final List<Widget> landingChildren;
  final bool showPrivacyPolicy;
  LandingView(
      {required this.description,
      required this.showPrivacyPolicy,
      required this.landingChildren});
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 25,
                ),
                Text(
                  "Flutter",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.primary),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Image.asset("images/landing_image.jpg"),
          ),
          if (description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                description,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ...landingChildren,
          if (showPrivacyPolicy)
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: const [
                  Text(
                    "By singing up you accept the ",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Terms of service ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "and ",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ))
        ]),
      ),
    );
  }
}
