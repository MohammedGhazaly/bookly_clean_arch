import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImage extends StatelessWidget {
  final String image;
  const CustomBookImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
          )
          // Container(
          //   // margin: EdgeInsets.symmetric(horizontal: 16.w),
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: NetworkImage(image),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
