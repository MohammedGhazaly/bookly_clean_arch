import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsCustomAppBar extends StatelessWidget {
  const BookDetailsCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: Icon(
            Icons.close,
            size: 24.sp,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: Icon(
            Icons.shopping_cart_outlined,
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}
