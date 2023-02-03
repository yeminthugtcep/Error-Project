import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPersonTile extends StatelessWidget {
  final String name;
  final void Function()? onpressed;
  AddPersonTile({required this.name, required this.onpressed});
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.theme.colorScheme.primary,
          ),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          name,
          style:
              TextStyle(fontSize: 22, color: context.theme.colorScheme.primary),
        ),
        IconButton(
          onPressed: onpressed,
          icon: Icon(
            Icons.person_add,
            color: context.theme.colorScheme.primary,
          ),
        ),
      ]),
    );
  }
}
