import 'package:bookly_clean_arch/core/constants/values.dart';
import 'package:bookly_clean_arch/core/simple_bloc_observer.dart';
import 'package:bookly_clean_arch/core/utils/app_theme.dart';
import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/core/utils/di/service_locator_di.dart';
import 'package:bookly_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_newest_use_case.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(AppValues.feauredBox);
  await Hive.openBox<BookEntity>(AppValues.newestBox);
  createApiServiceLocator();
  createHomeRepoServiceLocator();
  Bloc.observer = SimpleBlocObserver();

  runApp(
    const BooklyApp(),
  );
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeaturedBooksCubit(
            featuredBooksUseCase:
                FeaturedBooksUseCase(homeRepo: locator.get<HomeRepoImpl>()),
          )..fetchFeaturedBooks();
        }),
        BlocProvider(create: (context) {
          return NewestBooksCubit(
            fetchNewestBooksUseCase:
                FetchNewstBooksUseCase(homeRepo: locator.get<HomeRepoImpl>()),
          );
        })
      ],
      child: ScreenUtilInit(
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
      ),
    );
  }
}
