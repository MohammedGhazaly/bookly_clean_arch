import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookly_clean_arch/core/constants/assets.dart';
import 'package:bookly_clean_arch/core/utils/app_styles.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerListViewItem extends StatelessWidget {
  final BookEntity book;
  const BestSellerListViewItem({super.key, required this.book});

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
                child: CachedNetworkImage(
                  imageUrl: book.image ?? "",
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      AppStyles.style20.copyWith(fontFamily: "GT Sectra Fine"),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  book.authors?.join(",") ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.style14
                      .copyWith(color: Colors.white.withOpacity(0.5)),
                ),
                SizedBox(
                  height: 8,
                ),
                // Spacer(),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        "19.99\$",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.style16
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Color(0xFffFDD4F),
                          ),
                          Expanded(
                            child: AutoSizeText.rich(
                              overflow: TextOverflow.ellipsis,
                              minFontSize: 12,
                              maxLines: 1,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "4.8 ",
                                    style: AppStyles.style14,
                                  ),
                                  TextSpan(
                                    text: "(2390)",
                                    style: AppStyles.style14.copyWith(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
