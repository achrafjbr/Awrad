import 'package:abu_sandia/controller/services/initialization_firebase_services/batch_write_initialization.dart';
import 'package:abu_sandia/controller/services/quote_service/quote.dart';
import 'package:abu_sandia/model/quote_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/firebase_collections/collections.dart';
import '../initialization_firebase_services/fire_store_initialization.dart';

class QuoteService implements Quote {
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getQuotes({
    required String document,
  }) async {
    QuerySnapshot<Map<String, dynamic>> quotes =
        await FireStoreInitialization.fireStoreInitialization()
            .collection(Collections.categoriesCollection)
            .doc(document)
            .collection(Collections.quotesCollection)
            .limit(10)
            .get();
    return quotes;
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getMostSeenQuotes() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> mostSeenQuotesList =
        [];
    QuerySnapshot<Map<String, dynamic>> mostSeenCategories =
        await FireStoreInitialization.fireStoreInitialization()
            .collection(Collections.categoriesCollection)
            .orderBy('views', descending: true)
            .limit(2)
            .get();
    mostSeenQuotesList =
        await getFiveMostQuotesSeen(categoryDocuments: mostSeenCategories.docs);
    return mostSeenQuotesList;
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getNewQuotes() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> newQuotesList = [];
    QuerySnapshot<Map<String, dynamic>> newCategories =
        await FireStoreInitialization.fireStoreInitialization()
            .collection(Collections.categoriesCollection)
            .orderBy('createdAt', descending: true)
            .limit(2)
            .get();
    newQuotesList =
        await getFiveMostQuotesSeen(categoryDocuments: newCategories.docs);
    return newQuotesList;
  }


  /// Helper method is founded in [getMostSeenQuotes] to get most seen Quotes
  /// from different Categories.
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
  getFiveMostQuotesSeen({
    required List<QueryDocumentSnapshot<Map<String, dynamic>>>
    categoryDocuments,
  }) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>
    quotesSnapshotList = [];
    for (final document in categoryDocuments) {
      int index = 0;
      QuerySnapshot<Map<String, dynamic>> quotesSnapshot =
      await FireStoreInitialization.fireStoreInitialization()
          .collection(Collections.categoriesCollection)
          .doc(document.id)
          .collection(Collections.quotesCollection)
          .orderBy('views', descending: true)
          .limit(5)
          .get();
      print('index length quote list $index ${quotesSnapshot.docs.length}');
      index =index+1;
      quotesSnapshotList.addAll(quotesSnapshot.docs);

    }
    return quotesSnapshotList;
  }




  @override
  Future<void> seeQuote({
    required String category,
    required QuoteModel quoteModel,
  }) async {
    WriteBatch batch = BatchWriteInitialization.writeBatchInitialization();
    quoteModel.views += 1;
    final document = FireStoreInitialization.fireStoreInitialization()
        .collection(Collections.categoriesCollection)
        .doc(category)
        .collection(Collections.quotesCollection)
        .doc(quoteModel.documentID);
    batch.update(
      document,
      quoteModel.toJson(),
    );
    await batch.commit();
  }


  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getNextQuotes(
      {DocumentSnapshot<Object?>? documentSnapshot,
      required String category}) async {
    QuerySnapshot<Map<String, dynamic>> quotesSnapshot =
        await FireStoreInitialization.fireStoreInitialization()
            .collection(Collections.categoriesCollection)
            .doc(category)
            .collection(Collections.quotesCollection)
            .orderBy('views', descending: true)
            .startAfterDocument(documentSnapshot!)
            .limit(10)
            .get();
    return quotesSnapshot.docs;
  }
}
