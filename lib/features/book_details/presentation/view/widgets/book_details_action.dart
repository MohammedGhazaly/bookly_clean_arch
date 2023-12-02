import 'package:bookly_clean_arch/core/utils/app_styles.dart';
import 'package:bookly_clean_arch/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsAction extends StatelessWidget {
  const BookDetailsAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: "1000.99 \$",
            backgroundColor: Colors.white,
            forgroundColor: Colors.black,
            textStyle: AppStyles.style16.copyWith(fontWeight: FontWeight.w900),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              bottomLeft: Radius.circular(16.r),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            backgroundColor: Color(0xffEF8262),
            forgroundColor: Colors.white,
            text: "Free preview",
            textStyle: AppStyles.style16,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
          ),
        ),
      ],
    );
  }
}
