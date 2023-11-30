import 'package:hive/hive.dart';
part "book_entity.g.dart";

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final List<String>? authors;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? pageCount;

  BookEntity(
      {required this.bookId,
      required this.title,
      required this.image,
      required this.authors,
      required this.price,
      required this.pageCount});
}
