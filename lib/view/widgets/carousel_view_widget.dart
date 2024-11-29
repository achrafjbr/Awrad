import 'package:abu_sandia/constants/themes/app_themes.dart';
import 'package:abu_sandia/model/quote_model.dart';
import 'package:abu_sandia/routes/navigation.dart';
import 'package:abu_sandia/view/widgets/cache_network_image_widget.dart';
import 'package:abu_sandia/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../../responsiveness/responsive_component/app_padding.dart';
import '../../responsiveness/responsive_component/dimensions.dart';
import '../screens/quote_screen.dart';
import 'overlay_widget.dart';

class CarouselViewWidget extends StatelessWidget {
  final List<QuoteModel> quotes;

  const CarouselViewWidget({super.key, required this.quotes});

  @override
  Widget build(BuildContext context) {

    return CarouselView(
      elevation: 5,
      itemSnapping: true,
      scrollDirection: Axis.horizontal,
      itemExtent: 250,
      padding: AppPadding.onlyPaddingGeometry(
        context: context,
        right: 0.04,
      ),
      onTap: (index) {
        Navigation.pushNavigator(
            context: context,
            page: QuoteScreen(
              quote: quotes[index],
            ),
        );
      },
      children: List.generate(
        quotes.length, // Here will be the categories length;
            (index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: quotes[index].quoteID,
                transitionOnUserGestures: true,
                child: CacheNetworkImageWidget(
                  image: quotes[index].image,
                  fit: BoxFit.cover,
                  height: 0.10,
                  width: 0.10,
                ),
              ),
              // Actually i don't know the height and width of the is set
              // by default in [childAspectRatio],
              // [OverlayWidget] will ignore  height & width
              // bellow and will fitted depend on [childAspectRatio].
              OverlayWidget(
                color: AppThemes.kBlack.withOpacity(0.3),
                height: 0.30,
                width: 0.30,
              ),

              /// Note : this is gonna be the Title of Quote.
              Container(
                alignment: Alignment.center,
                child: TextWidget(
                  textOverflow: TextOverflow.visible,
                  textAlign: TextAlign.right,
                  title: quotes[index].title,
                  textColor: AppThemes.kWhite,
                  textDirection: TextDirection.rtl,
                  textFontSize: Dimensions.setFontDimension(
                    context: context,
                    value: 0.11,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
