import 'package:bookly_clean_arch/core/utils/app_theme.dart';
import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Bookly App',
          theme: AppTheme.mainTheme,
          routerConfig: AppRoutes.router,
        );
      },
    );
  }
}
