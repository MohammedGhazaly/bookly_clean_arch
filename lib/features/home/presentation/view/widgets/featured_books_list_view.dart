import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/featured_books_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRoutes.kHomeDetailsViewRoute);
              },
              child: FeaturedBooksItem(),
            ),
          );
        });
  }
}
