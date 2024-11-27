import 'package:abu_sandia/constants/images/image_paths.dart';
import 'package:abu_sandia/constants/images/image_roots.dart';
import 'package:abu_sandia/constants/padding/app_padding_dimensions.dart';
import 'package:abu_sandia/constants/themes/app_themes.dart';
import 'package:abu_sandia/responsiveness/responsive_component/Dimensions.dart';
import 'package:abu_sandia/responsiveness/responsive_component/app_padding.dart';
import 'package:abu_sandia/responsiveness/responsive_component/box.dart';
import 'package:abu_sandia/routes/navigation.dart';
import 'package:abu_sandia/view/widgets/asset_image_widget.dart';
import 'package:abu_sandia/view/widgets/header_button_widget.dart';
import 'package:abu_sandia/view/widgets/staggered_grid_view.dart';
import 'package:abu_sandia/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubits/cubit_instance_helper/cubit_instance.dart';
import '../../controller/cubits/quotes_cubit/quote_cubit.dart';

class QuotesCategoriesScreen extends StatefulWidget {
  final String? category;

  const QuotesCategoriesScreen({
    super.key,
    this.category,
  });

  @override
  State<QuotesCategoriesScreen> createState() => _QuotesCategoriesScreenState();
}

class _QuotesCategoriesScreenState extends State<QuotesCategoriesScreen> {
  ScrollController scrollController = ScrollController();

// QuoteCubit instance.
  late QuoteCubit quoteCubit;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    // QuoteCubit instance.
    quoteCubit = CubitInstance<QuoteCubit>().cubitInstance(context: context);
    // Get quotes.
    quoteCubit.getQuotes(document: widget.category!);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scrollController.addListener(onScrolling);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void onScrolling() {
    // If pixels of scroller achieve the max of screen
    // and the length of [quotes] list > 10 means that previous
    // that of this list is achieves the limit and getNextQuotes()
    // method will execute.
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        quoteCubit.quotes.length > 10) {
      // Get quotes.
      quoteCubit.getNextQuotes(
        category: widget.category!,
        documentSnapshot: quoteCubit.quotes.last.documentSnapshot,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPadding.symmetricPadding(
        context: context,
        horizontal: AppPaddingDimensions.horizontalPadding,
        vertical: AppPaddingDimensions.verticalPadding,
        child: Column(
          children: [
            // V.space.
            Box.verticalBox(context: context, height: 0.04),
            // Header includes:
            // - BackButton.
            // - Quote title.
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                HeaderButtonWidget(
                  color: AppThemes.kPrimary,
                  child: AssetImageWidget(
                    color: AppThemes.kPrimary,
                    imageWidth: 0.06,
                    imageHeight: 0.06,
                    image: ImagePaths.backIcon,
                    imageRoot: ImageRoots.appImagesRoot,
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft,
                  ),
                  onTap: () => Navigation.popNavigator(context: context),
                ),
                // H. space.
                Box.setBox(context: context, width: 0.20),
                // category title.
                TextWidget(
                  title: widget.category!,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  textColor: AppThemes.kWhite,
                  textFontWeight: FontWeight.bold,
                  textFontSize: Dimensions.setFontDimension(
                    context: context,
                    value: 0.10,
                  ),
                ),
              ],
            ),

            // V.space.
            Box.verticalBox(context: context, height: 0.04),

            // Quotes gridview:
            Expanded(
              child: BlocBuilder<QuoteCubit, QuoteState>(
                builder: (context, state) {

                  if (state is QuoteLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  else if (state is QuoteSuccessState) {
                    return StaggeredGridView(
                      // scrollController,
                      scrollController: scrollController,
                      category: widget.category,
                      quotes: quoteCubit.quotes,
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
