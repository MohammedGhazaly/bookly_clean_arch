import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookly_clean_arch/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BookDetailsRating extends StatelessWidget {
  const BookDetailsRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(
          flex: 1,
        ),
        Icon(
          Icons.star_rounded,
          color: Color(0xFffFDD4F),
        ),
        Expanded(
          child: AutoSizeText.rich(
            overflow: TextOverflow.ellipsis,
            minFontSize: 10,
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
        ),
        Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
