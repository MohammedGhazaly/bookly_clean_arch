import 'package:bookly_clean_arch/core/constants/assets.dart';
import 'package:bookly_clean_arch/core/constants/values.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> fadeTransitionAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuilt");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppAssets.logo),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context, _) {
            return FadeTransition(
              opacity: fadeTransitionAnimation,
              child: SlideTransition(
                position: slidingAnimation,
                child: const Text(
                  "Read free books",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation = Tween<Offset>(begin: Offset(0, 10), end: Offset(0, 0))
        .animate(animationController);
    fadeTransitionAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);

    animationController.forward();
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });
    // slidingController =
    //     AnimationController(vsync: this, duration: const Duration(seconds: 1));

    // fadeTransitionAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  void navigateToHome() {
    Future.delayed(AppValues.waitDuration, () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeView();
      }));
    });
  }
}
