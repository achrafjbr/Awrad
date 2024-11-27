import 'package:abu_sandia/model/quote_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/quote_service/quote.dart';

class QuoteRepository {
  Quote quote;

  QuoteRepository({required this.quote});

  Future<List<QuoteModel>> getQuotes({required String document}) async {
    List<QuoteModel> quotesList = [];
    QuerySnapshot<Map<String, dynamic>> quotes =
        await quote.getQuotes(document: document);
    quotesList = quotes.docs.map((document) {
      Map<String, dynamic> data = document.data();
      data['documentID'] = document.id;
      data['documentSnapshot'] = document;
      return QuoteModel.fromJson(data);
    }).toList();

    return quotesList;
  }

  Future<List<QuoteModel>> getMostSeenQuotes() async {
    List<QuoteModel> quotesModelList = [];
    List<List<QueryDocumentSnapshot<Map<String, dynamic>>>> quotesList =
        await quote.getMostSeenQuotes();
    for (final quotes in quotesList) {
      quotesModelList = quotes.map((quote) {
        Map<String, dynamic> data = quote.data();
        print('views = ${data['views']}');
        data['documentID'] = quote.id;
        data['documentSnapshot'] = quote;
        return QuoteModel.fromJson(data);
      }).toList();
    }
    print(quotesModelList.length);
    return quotesModelList;
  }

  Future<List<QuoteModel>> getNewQuotes() async {
    List<QuoteModel> quotesModelList = [];
    List<List<QueryDocumentSnapshot<Map<String, dynamic>>>> quotesList =
        await quote.getMostSeenQuotes();
    for (final quotes in quotesList) {
      quotesModelList = quotes.map((quote) {
        Map<String, dynamic> data = quote.data();
        data['documentID'] = quote.id;
        data['documentSnapshot'] = quote;
        return QuoteModel.fromJson(data);
      }).toList();
    }
    return quotesModelList;
  }

  Future<void> seeQuote({
    required String category,
    required QuoteModel quoteModel,
  }) async {
    await quote.seeQuote(
      category: category,
      quoteModel: quoteModel,
    );
  }

  Future<List<QuoteModel>> getNextQuotes({
    DocumentSnapshot<Object?>? documentSnapshot,
    required String category,
  }) async {
    List<QuoteModel> quotesModelList = [];
    List<QueryDocumentSnapshot<Map<String, dynamic>>> quotesList =
        await quote.getNextQuotes(
      category: category,
      documentSnapshot: documentSnapshot,
    );
    quotesModelList = quotesList.map((quote) {
      Map<String, dynamic> data = quote.data();
      data['documentID'] = quote.id;
      data['documentSnapshot'] = quote;
      return QuoteModel.fromJson(data);
    }).toList();
    return quotesModelList;
  }
}
