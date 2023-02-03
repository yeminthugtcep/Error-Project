import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/utils/appbar_shape.dart';
import 'package:randomdog/widget/detail/create_post_card.dart';

///widget::AnmouceCard
class ToCreatePostCard extends StatelessWidget {
  final String profileImage, title;
  ToCreatePostCard({required this.profileImage, required this.title});
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: createLesson,
        leading: Container(
          height: 30,
          width: 30,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: CachedNetworkImage(
            imageUrl: profileImage,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.repeat),
          onPressed: () {},
        ),
      ),
    );
  }
}

///detail::trading button
Future createLesson() {
  return Get.bottomSheet(CreatePostCard(), //CreatePostView
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: appBarShape);
}
