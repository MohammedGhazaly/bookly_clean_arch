import 'package:bloc/bloc.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  late FeaturedBooksUseCase featuredBooksUseCase;
  FeaturedBooksCubit() : super(FeaturedBooksInitial());
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await featuredBooksUseCase.invoke();
    result.fold(
      (l) {
        emit(FeaturedBooksFailure(errorMessage: l.errorMessage));
      },
      (r) {
        emit(FeaturedBooksSuccess(books: r));
      },
    );
  }
}
