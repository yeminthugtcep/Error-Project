import 'package:flutter/material.dart';
import '/widget/detail/detail_bottom_nav/add_person_tile.dart';

class DetailScreenPeopleView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AddPersonTile(
            name: "Teacher",
            onpressed: () {},
          ),
        ),
        for (int i = 0; i < 2; i++)
          ListTile(
            leading: const CircleAvatar(),
            title: Text("hello $i"),
            trailing: i == 0
                ? const SizedBox()
                : IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AddPersonTile(
            name: "Student",
            onpressed: () {},
          ),
        ),
        for (int i = 0; i < 10; i++)
          ListTile(
            leading: const CircleAvatar(),
            title: Text("hello $i"),
            trailing: i == 0
                ? const SizedBox()
                : IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ),
      ],
    );
  }
}
