import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///Widgets::class_room_card.dart
class ClassRoomCard extends StatelessWidget {
  final String backgroundImage, title, preiod, instructor;
  const ClassRoomCard(
      {required this.backgroundImage,
      required this.title,
      required this.preiod,
      required this.instructor});
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: context.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(backgroundImage),
              fit: BoxFit.cover)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              subtitle: Text(
                preiod,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, bottom: 10),
              child: Text(
                instructor,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ]),
    );
  }
}
