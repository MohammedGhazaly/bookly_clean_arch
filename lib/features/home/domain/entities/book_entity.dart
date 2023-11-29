class BookEntity {
  final String? bookId;
  final String? title;
  final String? image;
  final List<String>? authors;
  final num? price;
  final num? pageCount;

  BookEntity(
      {required this.bookId,
      required this.title,
      required this.image,
      required this.authors,
      required this.price,
      required this.pageCount});
}
