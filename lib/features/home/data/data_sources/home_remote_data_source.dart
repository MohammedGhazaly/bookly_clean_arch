import 'package:bookly_clean_arch/core/services/api_service.dart';
import 'package:bookly_clean_arch/features/home/data/models/book_response_model/book.dart';
import 'package:bookly_clean_arch/features/home/domain/data_sources/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final response = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=mystery");
    List<BookEntity> books = getBooksList(response);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {}

  List<BookEntity> getBooksList(response) {
    List<BookEntity> books = [];
    for (var book in response["items"]) {
      books.add(Book.fromJson(book));
    }
    return books;
  }
}
