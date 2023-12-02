import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({required int pageNumber});
  List<BookEntity> fetchNewestBooks();
}
