import 'package:bloc/bloc.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FeaturedBooksUseCase featuredBooksUseCase;
  FeaturedBooksCubit({required this.featuredBooksUseCase})
      : super(FeaturedBooksInitial());
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await featuredBooksUseCase.invoke(pageNumber);
    result.fold(
      (l) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(errorMessage: l.errorMessage));
        } else {
          emit(FeaturedBooksPaginationFailure(errorMessage: l.errorMessage));
        }
      },
      (r) {
        emit(FeaturedBooksSuccess(books: r));
      },
    );
  }
}
