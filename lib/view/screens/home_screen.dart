import 'package:abu_sandia/constants/themes/app_themes.dart';
import 'package:abu_sandia/controller/cubits/categories_cubit/category_cubit.dart';
import 'package:abu_sandia/controller/cubits/cubit_instance_helper/cubit_instance.dart';
import 'package:abu_sandia/controller/cubits/internet_cubit/connection_cubit.dart';
import 'package:abu_sandia/controller/cubits/quotes_cubit/quote_cubit.dart';
import 'package:abu_sandia/responsiveness/responsive_component/app_padding.dart';
import 'package:abu_sandia/responsiveness/responsive_component/box.dart';
import 'package:abu_sandia/responsiveness/responsive_component/dimensions.dart';
import 'package:abu_sandia/view/widgets/carousel_view_widget.dart';
import 'package:abu_sandia/view/widgets/categories_widget.dart';
import 'package:abu_sandia/view/widgets/staggered_grid_view.dart';
import 'package:abu_sandia/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/offline_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // CategoryCubit instance.
    CategoryCubit categoryCubitInstance =
        CubitInstance<CategoryCubit>().cubitInstance(context: context);

    // QuoteCubit instance.
    QuoteCubit quoteCubitInstance =
        CubitInstance<QuoteCubit>().cubitInstance(context: context);

    if (context.watch<ConnectionCubit>().state
        == ConnectionStatus.connected) {
      // Get categories.
      categoryCubitInstance.getCategories();

      // Get New Quotes.
      quoteCubitInstance.getNewQuotes();

      // Get most quotes seen.
      quoteCubitInstance.getMostSeenQuotes();
    }
    return Scaffold(
      body: OfflineBannerWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // V.space from the top.
            Box.verticalBox(context: context, height: 0.05),

            // New Quotes.
            Box.setBox(
              context: context,
              height: 0.33,
              width: 0.95,
              child: BlocBuilder<QuoteCubit, QuoteState>(
                builder: (context, state) {
                  if (state is QuoteLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is QuoteSuccessState) {
                    return CarouselViewWidget(
                      quotes: quoteCubitInstance.newQuotes,
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),

            // V.space
            Box.verticalBox(context: context, height: 0.02),

            // Categories.
            Box.setBox(
              context: context,
              height: 0.12,
              width: 0.95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // title : التصنيفات
                  AppPadding.horizontalPadding(
                    context: context,
                    horizontal: 0.04,
                    child: TextWidget(
                      title: 'التصنيفات',
                      textDirection: TextDirection.rtl,
                      textColor: AppThemes.kWhite,
                      textFontSize: Dimensions.setFontDimension(
                        context: context,
                        value: 0.10,
                      ),
                    ),
                  ),

                  // V.space
                  Box.verticalBox(context: context, height: 0.01),

                  // Categories.
                  BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CategorySuccessState) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: categoryCubitInstance.categories
                                .map(
                                  (category) => CategoriesWidget(
                                    categoriesModel: category,
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),

            // V.space
            Box.verticalBox(context: context, height: 0.02),

            // title : الأكثر طلباً
            AppPadding.horizontalPadding(
              context: context,
              horizontal: 0.04,
              child: TextWidget(
                title: 'الأكثر طلباً',
                textDirection: TextDirection.rtl,
                textColor: AppThemes.kWhite,
                textFontSize: Dimensions.setFontDimension(
                  context: context,
                  value: 0.10,
                ),
              ),
            ),

            // Most quotes seen.
            Expanded(
              child: BlocBuilder<QuoteCubit, QuoteState>(
                builder: (context, state) {
                  if (state is QuoteLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is QuoteSuccessState) {
                    return StaggeredGridView(
                      quotes: quoteCubitInstance.mostSeenQuotes,
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
