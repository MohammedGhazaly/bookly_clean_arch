import 'package:bloc/bloc.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_newest_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  late final FetchNewstBooksUseCase fetchNewestBooksUseCase;
  NewestBooksCubit() : super(NewestBooksInitial());

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.invoke();
    result.fold(
      (l) {
        emit(NewestBooksFailure(errorMessage: l.errorMessage));
      },
      (r) {
        emit(NewestBooksSuccess(books: r));
      },
    );
  }
}
