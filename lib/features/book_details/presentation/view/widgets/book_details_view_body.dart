import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookly_clean_arch/core/constants/values.dart';
import 'package:bookly_clean_arch/core/utils/app_styles.dart';
import 'package:bookly_clean_arch/features/book_details/presentation/view/widgets/book_details_action.dart';
import 'package:bookly_clean_arch/features/book_details/presentation/view/widgets/book_details_custom_app_bar.dart';
import 'package:bookly_clean_arch/features/book_details/presentation/view/widgets/book_details_rating.dart';
import 'package:bookly_clean_arch/features/book_details/presentation/view/widgets/similar_books_list_view.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookEntity bookEntity;

  const BookDetailsViewBody({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    print(bookEntity.authors);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: SingleChildScrollView(
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
              child: CustomBookImage(image: bookEntity.image ?? ""),
            ),
            SizedBox(
              height: 43.h,
            ),
            AutoSizeText(
              bookEntity.title ?? "",
              maxLines: 2,
              minFontSize: 24,
              textAlign: TextAlign.center,
              style: AppStyles.style30.copyWith(
                fontFamily: AppValues.gtCentraFineFont,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),

            Text(
              bookEntity.authors?.join(", ") ?? "",
              textAlign: TextAlign.center,
              style: AppStyles.style16
                  .copyWith(color: Colors.white.withOpacity(0.5)),
            ),
            SizedBox(
              height: 15.h,
            ),
            BookDetailsRating(),
            SizedBox(
              height: 37.h,
            ),
            BookDetailsAction(),
            SizedBox(
              height: 40.h,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "You can also like",
                style: AppStyles.style14,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 115.h,
              child: SimilrBooksListView(),
            ),
            // SizedBox(
            //   height: 40.h,
            // ),
          ],
        ),
      ),
    ));

    // CustomScrollView(
    //   slivers: [
    //     SliverFillRemaining(
    //       child: SafeArea(
    //         child: Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 30.w),
    //           child: Column(
    //             children: [
    //               SizedBox(
    //                 height: 16.h,
    //               ),
    //               BookDetailsCustomAppBar(),
    //               SizedBox(
    //                 height: 30.h,
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.symmetric(horizontal: 75.w),
    //                 child: CustomBookImage(),
    //               ),
    //               SizedBox(
    //                 height: 43.h,
    //               ),
    //               AutoSizeText(
    //                 "The jungle book",
    //                 maxLines: 2,
    //                 minFontSize: 24,
    //                 textAlign: TextAlign.center,
    //                 style: AppStyles.style30.copyWith(
    //                   fontFamily: AppValues.gtCentraFineFont,
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 6.h,
    //               ),
    //               Text(
    //                 "Rudyard Kipling",
    //                 style: AppStyles.style16
    //                     .copyWith(color: Colors.white.withOpacity(0.5)),
    //               ),
    //               SizedBox(
    //                 height: 15.h,
    //               ),
    //               BookDetailsRating(),
    //               SizedBox(
    //                 height: 37.h,
    //               ),
    //               BookDetailsAction(),
    //               Expanded(
    //                 child: SizedBox(
    //                   height: 40.h,
    //                 ),
    //               ),
    //               Align(
    //                 alignment: Alignment.bottomLeft,
    //                 child: Text(
    //                   "You can also like",
    //                   style: AppStyles.style14,
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 16.h,
    //               ),
    //               SizedBox(
    //                 height: 115.h,
    //                 child: SimilrBooksListView(),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
