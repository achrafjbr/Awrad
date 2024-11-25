import 'package:abu_sandia/model/quote_model.dart';

class CategoriesModel {
  final String category;
   int views;
  final DateTime createdAt;
  final List<QuoteModel>? quotes;

  CategoriesModel({
    this.views = 0,
    required this.createdAt,
    required this.category,
    this.quotes,
  });


  factory CategoriesModel.fromJson(
      Map<String, dynamic> categories, String category) {
    return CategoriesModel(
      views: categories['views'],
      category: category,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        (int.parse(categories['createdAt'])),
      ),
      quotes: categories['quote']?.map((quote)
      => QuoteModel.fromJson(quote)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt.millisecondsSinceEpoch.toString(),
        'category': category,
        'quote': quotes!.first.toJson(),
        'views': views,
      };

}
