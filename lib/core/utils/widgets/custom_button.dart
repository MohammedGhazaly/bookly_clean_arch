import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color forgroundColor;
  final Color backgroundColor;
  final TextStyle textStyle;
  final BorderRadiusGeometry borderRadius;
  const CustomButton(
      {super.key,
      required this.text,
      required this.forgroundColor,
      required this.backgroundColor,
      required this.textStyle,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: forgroundColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: () {},
        child: AutoSizeText(
          text,
          maxLines: 1,
          minFontSize: 10,
          style: textStyle,
        ),
      ),
    );
  }
}
