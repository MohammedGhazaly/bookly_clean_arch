import 'package:bookly_clean_arch/core/constants/assets.dart';
import 'package:bookly_clean_arch/core/utils/app_styles.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/featured_books_item.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),

          // TODO: implement listener

          CustomAppBar(),
          SizedBox(
            height: 45.h,
          ),
          SizedBox(
            height: 230.h,
            child: FeaturedBooksListView(),
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              "Best seller",
              style: AppStyles.style18.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: BestSellerListViewItem(),
          )
        ],
      ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                AppAssets.testImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
