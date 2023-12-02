import 'package:bookly_clean_arch/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImageLoading extends StatelessWidget {
  const CustomBookImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
