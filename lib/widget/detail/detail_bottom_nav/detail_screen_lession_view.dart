import 'package:flutter/cupertino.dart';
import 'package:randomdog/widget/detail/anmous_card.dart';
import 'package:randomdog/widget/detail/post_card.dart';
import 'package:randomdog/widget/detail/subject_card.dart';

class DetailScreenLessionView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(10), children: [
      SubjectCard(
        backgroundImage:
            "https://img.freepik.com/premium-photo/earth-space-galaxy-milky-way-backdrop-3d-illustration_357568-813.jpg?w=1380",
        title: "Dart Advance Class",
        subtitle: "Intermediate To Advance",
      ),
      const SizedBox(
        height: 5,
      ),
      ToCreatePostCard(
        profileImage:
            "https://img.freepik.com/premium-photo/earth-space-galaxy-milky-way-backdrop-3d-illustration_357568-813.jpg?w=1380",
        title: "Anmounce to your class...",
      ),
      for (int i = 0; i < 100; i++)
        PostCard(
          profileImage:
              "https://img.freepik.com/premium-photo/earth-space-galaxy-milky-way-backdrop-3d-illustration_357568-813.jpg?w=1380",
          userName: "Ye Min Thu",
          createDate: DateTime.now().toString(),
          description:
              """If a student letters in a particular sport, they are given a prize for achievement in sport in the shape of the first letter of the name of their high school or university, which is often worn on a special jacket or sweater:""",
        ),
    ]);
  }
}
