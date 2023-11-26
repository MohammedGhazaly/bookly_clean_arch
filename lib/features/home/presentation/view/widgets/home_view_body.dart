import 'package:bookly_clean_arch/core/constants/assets.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          CustomAppBar(),
        ],
      ),
    );
  }
}
