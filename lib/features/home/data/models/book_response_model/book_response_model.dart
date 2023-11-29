import 'book.dart';

class BookResponseModel {
  String? kind;
  num? totalItems;
  List<Book>? books;

  BookResponseModel({this.kind, this.totalItems, this.books});

  factory BookResponseModel.fromJson(Map<String, dynamic> json) {
    return BookResponseModel(
      kind: json['kind'] as String?,
      totalItems: json['totalItems'] as num?,
      books: (json['items'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': books?.map((e) => e.toJson()).toList(),
      };
}
