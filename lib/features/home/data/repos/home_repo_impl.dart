import 'dart:io';

import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/features/home/domain/data_sources/home_local_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/data_sources/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      var cachedBooks =
          homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (cachedBooks.isNotEmpty) {
        return right(cachedBooks);
      }
      var remoteBooks =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(remoteBooks);
    } catch (e) {
      if (e is SocketException) {
        return left(NetworkFailure(
            errorMessage: "No internet connection, please try again later."));
      } else if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var cachedBooks = homeLocalDataSource.fetchNewestBooks();
      if (cachedBooks.isNotEmpty) {
        return right(cachedBooks);
      }
      var remoteBooks = await homeRemoteDataSource.fetchNewestBooks();
      return right(remoteBooks);
    } catch (e) {
      if (e is SocketException) {
        return left(NetworkFailure(
            errorMessage: "No internet connection, please try again later."));
      } else if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
