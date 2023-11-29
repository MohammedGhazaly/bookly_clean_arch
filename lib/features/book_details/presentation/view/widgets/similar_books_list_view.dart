import 'package:bookly_clean_arch/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilrBooksListView extends StatelessWidget {
  const SimilrBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: InkWell(
            onTap: () {},
            child: CustomBookImage(),
          ),
        );
      },
    );
  }
}
