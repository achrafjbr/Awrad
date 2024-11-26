import 'package:abu_sandia/controller/services/categorie_service/category.dart';
import 'package:abu_sandia/model/categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/firebase_collections/collections.dart';
import '../initialization_firebase_services/batch_write_initialization.dart';
import '../initialization_firebase_services/fire_store_initialization.dart';

class CategoryService implements Category {
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getCategories() async {
    QuerySnapshot<Map<String, dynamic>> categories =
        await FireStoreInitialization.fireStoreInitialization()
            .collection(Collections.categoriesCollection)
            .get();
    return categories;
  }

  @override
  Future<void> getCategory() {
    // TODO: implement getCategory
    throw UnimplementedError();
  }

  @override
  Future<void> seeCategory({required CategoriesModel categoryModel}) async {
    WriteBatch batch = BatchWriteInitialization.writeBatchInitialization();
    int categoryViews = categoryModel.views += 1;
    final document = FireStoreInitialization.fireStoreInitialization()
        .collection(Collections.categoriesCollection)
        .doc(categoryModel.category);
    batch.update(
      document,
      {
        'views': categoryViews,
      },
    );
    await batch.commit();
  }
}
