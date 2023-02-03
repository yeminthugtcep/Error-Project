import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///widget::SubjectCard
class SubjectCard extends StatelessWidget {
  final String backgroundImage, title, subtitle;
  SubjectCard(
      {required this.backgroundImage,
      required this.title,
      required this.subtitle});
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: context.width,
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: CachedNetworkImageProvider(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            )
          ]),
    );
  }
}
