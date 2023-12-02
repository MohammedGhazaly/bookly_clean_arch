import 'package:bookly_clean_arch/core/utils/app_styles.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/best_seller_list_view_builder.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/featured_books_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      // physics: ,

      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
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
                  child: FeaturedBooksListViewConsumer(),
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
                // SizedBox(
                //   height: 20.h,
                // ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: SizedBox(
            // height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 15.w),
              child: BestSellerListViewBuilder(),
            ),
          ),
        )
      ],
    );
  }
}
