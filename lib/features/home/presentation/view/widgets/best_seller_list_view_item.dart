import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookly_clean_arch/core/constants/assets.dart';
import 'package:bookly_clean_arch/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Harry Potter and the goblet of fire",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      AppStyles.style20.copyWith(fontFamily: "GT Sectra Fine"),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "J.K. Rowling",
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
