import 'package:bookly_clean_arch/core/constants/colors.dart';
import 'package:bookly_clean_arch/core/utils/app_styles.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/featured_books_list_view.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewConsumer extends StatefulWidget {
  const FeaturedBooksListViewConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewConsumer> createState() =>
      _FeaturedBooksListViewConsumerState();
}

class _FeaturedBooksListViewConsumerState
    extends State<FeaturedBooksListViewConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(
                SnackBar(
                  backgroundColor: Colors.white,
                  content: Text(
                    state.errorMessage,
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              )
              .closed
              .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMessage),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    BlocProvider.of<FeaturedBooksCubit>(context)
                        .fetchFeaturedBooks();
                  },
                  child: Text(
                    "Try again",
                    style: AppStyles.style14.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return FeaturedBooksListViewLoadingIndicator();
      },
    );
  }
}
