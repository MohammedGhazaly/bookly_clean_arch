import 'package:bookly_clean_arch/core/constants/values.dart';
import 'package:bookly_clean_arch/features/home/domain/data_sources/home_local_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(AppValues.feauredBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(AppValues.newestBox);
    return box.values.toList();
  }
}
