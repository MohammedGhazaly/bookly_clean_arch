import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  final List<BookEntity> books;
  const BestSellerListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRoutes.kHomeDetailsViewRoute, extra: books[index]);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: BestSellerListViewItem(book: books[index]),
            ),
          );
        });
  }
}
