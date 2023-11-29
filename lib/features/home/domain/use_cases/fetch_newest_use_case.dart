import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/use_case/use_case.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewsUseCase implements UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchNewsUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> invoke([NoParam? param]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
