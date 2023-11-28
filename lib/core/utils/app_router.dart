import 'package:bookly_clean_arch/features/home/presentation/view/home_view.dart';
import 'package:bookly_clean_arch/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const kHomeViewRoute = "/home-view";
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeViewRoute,
        builder: (context, state) {
          return const HomeView();
        },
      )
    ],
  );
}
