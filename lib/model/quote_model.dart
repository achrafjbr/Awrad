import 'package:cloud_firestore/cloud_firestore.dart';

class QuoteModel {
  final String quoteID;
  final String documentID;
  final String title;
  final String description;
  final DateTime createdAt;
  int views;
  final String image;
   DocumentSnapshot documentSnapshot;

  QuoteModel({
    required this.documentSnapshot,
    required this.documentID,
    required this.image,
    required this.title,
    required this.createdAt,
    required this.description,
    required this.views,
    required this.quoteID,
  });

  factory QuoteModel.fromJson(
    Map<String, dynamic> quotes,
  ) =>
      QuoteModel(
        documentSnapshot: quotes['documentSnapshot'],
        documentID: quotes['documentID'] ?? '',
        image: quotes['image'],
        title: quotes['title'],
        description: quotes['description'],
        views: quotes['views'],
        quoteID: quotes['quoteID'],
        createdAt: DateTime.fromMillisecondsSinceEpoch(
            (int.parse(quotes['createdAt']))),
      );


  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'views': views,
        'quoteID': quoteID,
        'createdAt': createdAt.millisecondsSinceEpoch.toString(),
        'image': image
      };
}
