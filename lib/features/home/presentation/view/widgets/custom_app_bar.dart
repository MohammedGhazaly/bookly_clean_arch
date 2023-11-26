import 'package:bookly_clean_arch/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppAssets.logo,
            width: 75.w,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {},
            child: Icon(
              Icons.search_rounded,
              size: 32.sp,
            ),
          )
        ],
      ),
    );
  }
}
