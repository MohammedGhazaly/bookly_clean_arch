import 'package:bookly_clean_arch/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBuilder extends StatelessWidget {
  const BestSellerListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return BestSellerListView(
            books: state.books,
          );
        } else if (state is NewestBooksFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
    );
  }
}
