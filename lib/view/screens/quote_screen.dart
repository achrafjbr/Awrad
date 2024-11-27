import 'package:abu_sandia/constants/padding/app_padding_dimensions.dart';
import 'package:abu_sandia/model/quote_model.dart';
import 'package:abu_sandia/view/widgets/cache_network_image_widget.dart';
import 'package:abu_sandia/view/widgets/overlay_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/images/image_paths.dart';
import '../../constants/images/image_roots.dart';
import '../../constants/themes/app_themes.dart';
import '../../responsiveness/responsive_component/Dimensions.dart';
import '../../responsiveness/responsive_component/app_padding.dart';
import '../../responsiveness/responsive_component/box.dart';
import '../../routes/navigation.dart';
import '../widgets/asset_image_widget.dart';
import '../widgets/header_button_widget.dart';
import '../widgets/text_widget.dart';

class QuoteScreen extends StatelessWidget {
  final QuoteModel quote;

  const QuoteScreen({
    super.key,
     required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Cover image.
          Hero(
            tag: quote.quoteID,
            transitionOnUserGestures: true,
            child: CacheNetworkImageWidget(
              image: quote.image,
              fit: BoxFit.cover,
              height: 0.10,
              width: 0.10,
            ),
          ),

          // Overly over image.
          OverlayWidget(
            height: 0.98,
            width: 0.98,
            color: AppThemes.kBlack.withOpacity(0.6),
          ),

          // Header includes:
          // - BackButton.
          // - Quote title.
          Positioned(
            top: Dimensions.setHeight(context: context, height: 0.05),
            child: AppPadding.symmetricPadding(
              context: context,
              vertical: AppPaddingDimensions.verticalPadding,
              horizontal: AppPaddingDimensions.horizontalPadding,
              child: Row(
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
                  Box.setBox(context: context, width: 0.20),
                  TextWidget(
                    title: quote.title,
                     textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    textColor: AppThemes.kWhite,
                    textFontWeight: FontWeight.bold,
                    textFontSize: Dimensions.setFontDimension(
                      context: context,
                      value: 0.09,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Quote description.
          Positioned(
            top: Dimensions.setHeight(context: context, height: 0.15),
            bottom: Dimensions.setHeight(context: context, height: 0.02),
            child: AppPadding.symmetricPadding(
              context: context,
              horizontal: 0.03,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: Dimensions.setWidth(
                    context: context,
                    width: 0.90,
                  ),
                  maxHeight: Dimensions.setHeight(
                    context: context,
                    height: 1, // Adjust this to control scrollable height
                  ),
                ),
                child: SingleChildScrollView(
                  child: TextWidget(
                    title: quote.description,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    textColor: AppThemes.kWhite,
                    textFontWeight: FontWeight.bold,
                    textFontSize: Dimensions.setFontDimension(
                      context: context,
                      value: 0.11,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
