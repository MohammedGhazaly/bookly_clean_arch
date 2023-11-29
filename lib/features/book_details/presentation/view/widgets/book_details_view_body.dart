import 'package:bookly_clean_arch/features/book_details/presentation/view/widgets/book_details_custom_app_bar.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            BookDetailsCustomAppBar(),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 75.w),
              child: CustomBookImage(),
            )
          ],
        ),
      ),
    );
  }
}
