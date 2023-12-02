import 'package:bookly_clean_arch/core/constants/values.dart';
import 'package:bookly_clean_arch/features/home/domain/data_sources/home_local_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({required int pageNumber}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(AppValues.feauredBox);
    int length = box.values.length;

    // endIndex 50
    // length 50 endIndex 49
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(AppValues.newestBox);
    return box.values.toList();
  }
}
