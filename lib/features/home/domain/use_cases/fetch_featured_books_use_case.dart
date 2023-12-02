import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/use_case/use_case.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FeaturedBooksUseCase implements UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FeaturedBooksUseCase({required this.homeRepo});

  // invoke - call - execute

  @override
  Future<Either<Failure, List<BookEntity>>> invoke([int pageNumber = 0]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
  }
}
