import 'package:abu_sandia/constants/themes/app_themes.dart';
import 'package:abu_sandia/model/categories_model.dart';
import 'package:abu_sandia/responsiveness/responsive_component/app_padding.dart';
import 'package:abu_sandia/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:abu_sandia/responsiveness/responsive_component/dimensions.dart';

import '../../controller/cubits/categories_cubit/category_cubit.dart';
import '../../controller/cubits/cubit_instance_helper/cubit_instance.dart';
import '../../routes/navigation.dart';
import '../screens/quotes_categories_screen.dart';

class CategoriesWidget extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final VoidCallback? onTap;

  const CategoriesWidget({
    super.key,
    required this.categoriesModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // CategoryCubit instance.
    CategoryCubit categoryCubitInstance =
        CubitInstance<CategoryCubit>().cubitInstance(context: context);

    return InkWell(
      onTap: () {
        Navigation.pushNavigator(
          context: context,
          page: QuotesCategoriesScreen(
            category: categoriesModel.category,
          ),
        );
        categoryCubitInstance.seeCategory(
          categoryModel: categoriesModel,
        );
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: Dimensions.setWidth(
            context: context,
            width: 0.40,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.setRadius(
            context: context,
            radius: 0.10,
          )),
          color: AppThemes.kPrimary,
        ),
        padding: AppPadding.allPaddingGeometry(
          context: context,
          value: 0.05,
        ),
        margin: AppPadding.onlyPaddingGeometry(
          context: context,
          right: 0.02,
        ),
        child: TextWidget(
          title: categoriesModel.category,
          textDirection: TextDirection.rtl,
          textColor: AppThemes.kWhite,
          textAlign: TextAlign.center,
          textFontSize: Dimensions.setFontDimension(
            context: context,
            value: 0.08,
          ),
          textOverflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
