import 'package:abu_sandia/controller/services/categorie_service/category.dart';
import 'package:abu_sandia/model/categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryRepository {
  Category category;

  CategoryRepository({required this.category});

  Future<List<CategoriesModel>> getCategories() async {
    List<CategoriesModel> categoriesList = [];
    QuerySnapshot<Map<String, dynamic>> categories =
        await category.getCategories();

    categoriesList = categories.docs
        .map(
          (categoryElement) => CategoriesModel.fromJson(
              categoryElement.data(), categoryElement.id),
        )
        .toList();

    return categoriesList;
  }

  Future<void> getCategory() {
    // TODO: implement getCategory
    throw UnimplementedError();
  }

  Future<void> seeCategory({required CategoriesModel categoryModel}) async {
    await category.seeCategory(
      categoryModel: categoryModel,
    );
  }
}
