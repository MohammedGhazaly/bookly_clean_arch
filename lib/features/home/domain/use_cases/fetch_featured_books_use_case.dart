import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FeaturedBooksUseCase({required this.homeRepo});
  Future<Either<Failure, List<BookEntity>>> invoke() {
    return homeRepo.fetchFeaturedBooks();
  }
}
