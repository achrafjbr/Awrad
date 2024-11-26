import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/categories_model.dart';

abstract class Category {

  Future<void> getCategory();
  Future<QuerySnapshot<Map<String, dynamic>>> getCategories();

  Future<void> seeCategory({
    required CategoriesModel categoryModel,
  });
}
