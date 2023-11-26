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
        ],
      ),
    );
  }
}
