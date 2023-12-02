import 'package:bookly_clean_arch/core/utils/app_styles.dart';
import 'package:bookly_clean_arch/core/widgets/custom_fading_widget.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImage extends StatelessWidget {
  final String image;
  final String title;
  const CustomBookImage({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: CachedNetworkImage(
            progressIndicatorBuilder: (context, url, progress) {
              return CustomFadingWidget(
                child: Container(
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppStyles.style14.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                color: Colors.grey,
              );
            },
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
