import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertLink extends StatefulWidget {
  @override
  State<InsertLink> createState() => _InsertLinkState();
}

class _InsertLinkState extends State<InsertLink> {
  final insetLinkKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text("Add link"),
      ),
      content: Form(
        key: insetLinkKey,
        child: Container(
            child: TextFormField(
          controller: textController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => value?.isNotEmpty == true
              ? value?.startsWith("https://") == true
                  ? null
                  : "Invalid Link"
              : "required Link",
          decoration:
              const InputDecoration(hintText: "https://...", labelText: "Link"),
        )),
      ),
      actions: [
        SizedBox(
          width: 100,
          child: TextButton(
            onPressed: () {},
            child: const Text("Cancel"),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: textController,
          builder: (context, value, child) {
            return SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: !value.text.startsWith('https://') ? null : () {},
                child: const Text("Add"),
              ),
            );
          },
        )
      ],
    );
  }
}
