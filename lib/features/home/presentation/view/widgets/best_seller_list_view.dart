import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kHomeDetailsViewRoute);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: BestSellerListViewItem(),
            ),
          );
        });
  }
}
