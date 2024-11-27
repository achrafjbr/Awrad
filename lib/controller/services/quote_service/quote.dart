import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/quote_model.dart';

abstract class Quote {
  Future<QuerySnapshot<Map<String, dynamic>>> getQuotes(
      {required String document});

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getMostSeenQuotes();

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getNewQuotes();

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getNextQuotes({
    DocumentSnapshot? documentSnapshot,
    required String category,
  });

  Future<void> seeQuote({
    required String category,
    required QuoteModel quoteModel,
  });
}
