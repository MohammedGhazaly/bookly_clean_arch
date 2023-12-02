import 'package:bookly_clean_arch/core/constants/values.dart';
import 'package:bookly_clean_arch/core/services/api_service.dart';
import 'package:bookly_clean_arch/features/home/data/models/book_response_model/book.dart';
import 'package:bookly_clean_arch/features/home/domain/data_sources/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final response = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=mystery");
    print("Ok");

    List<BookEntity> books = getBooksList(response);

    await cacheBooks(books, AppValues.feauredBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    final response = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=mystery&sorting=newest");
    List<BookEntity> books = getBooksList(response);
    await cacheBooks(books, AppValues.newestBox);

    return books;
  }

  List<BookEntity> getBooksList(Response response) {
    List<BookEntity> books = [];
    for (var book in response.data["items"]) {
      books.add(Book.fromJson(book));
    }
    return books;
  }

  Future<void> cacheBooks(List<BookEntity> books, String booksKey) async {
    var box = Hive.box<BookEntity>(booksKey);
    await box.addAll(books);
  }
}
