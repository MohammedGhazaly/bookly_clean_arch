import 'package:bookly_clean_arch/core/utils/app_theme.dart';
import 'package:bookly_clean_arch/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookly App',
      theme: AppTheme.mainTheme,
      home: const SplashView(),
    );
  }
}
