import 'package:abu_sandia/controller/repositories/category_repositories/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../model/categories_model.dart';
import '../../services/categorie_service/categorie_service.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final CategoryRepository categoryRepository =
      CategoryRepository(category: CategoryService());
  List<CategoriesModel> categories = [];

  Future<void> getCategories() async {
    emit(CategoryLoadingState());
    try {
      categories = await categoryRepository.getCategories();
      emit(CategorySuccessState());
    } catch (error) {
      emit(CategoryErrorState(
        error: error.toString(),
      ));
    }
  }

  Future<void> seeCategory({required CategoriesModel categoryModel}) async {
    emit(CategoryLoadingState());
    try {
      await categoryRepository.seeCategory(
        categoryModel: categoryModel,
      );
      emit(CategorySuccessState());
    } catch (error) {
      emit(CategoryErrorState(error: error.toString()));
    }
  }
}
