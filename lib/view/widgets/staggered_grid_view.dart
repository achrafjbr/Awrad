import 'package:abu_sandia/model/quote_model.dart';
import 'package:abu_sandia/view/widgets/cache_network_image_widget.dart';
import 'package:abu_sandia/view/widgets/overlay_widget.dart';
import 'package:abu_sandia/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../../constants/themes/app_themes.dart';
import '../../controller/cubits/cubit_instance_helper/cubit_instance.dart';
import '../../controller/cubits/quotes_cubit/quote_cubit.dart';
import '../../responsiveness/responsive_component/app_padding.dart';
import '../../responsiveness/responsive_component/dimensions.dart';
import '../../routes/navigation.dart';
import '../screens/quote_screen.dart';

class StaggeredGridView extends StatelessWidget {
  const StaggeredGridView({
    super.key,
    required this.quotes,
    this.onTap,
    this.category,
  });

  final String? category;
  final List<QuoteModel> quotes;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // QuoteCubit instance.
    QuoteCubit quoteCubitInstance =
        CubitInstance<QuoteCubit>().cubitInstance(context: context);

    return AppPadding.onlyPadding(
      left: 0.07,
      right: 0.03,
      context: context,
      child: GridView.builder(
        padding: EdgeInsets.only(
          bottom: Dimensions.setHeight(context: context, height: 0.02),
          top: Dimensions.setHeight(context: context, height: 0.02),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 16, // Space between rows
          crossAxisSpacing: 16, // Space between columns
          childAspectRatio: 0.6, // Adjust for approximate card width/height
        ),
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          // Apply a top margin to odd-indexed items to create the offset effect
          return Transform.translate(
            offset: Offset(
                0,
                index.isOdd
                    ? Dimensions.setHeight(context: context, height: 0.05)
                    : 0), // Adjust the value to set the offset
            child: InkWell(
              onTap: () {
                Navigation.pushNavigator(
                  context: context,
                  page: QuoteScreen(
                    quote: quotes[index],
                  ),
                );
                if (category != null) {
                  quoteCubitInstance.seeQuote(
                    category: category!,
                    quoteModel: quotes[index],
                  );
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  Dimensions.setRadius(
                    context: context,
                    radius: 0.24,
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  textDirection: TextDirection.rtl,
                  children: [
                    Hero(
                      tag: quotes[index].documentID,
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
                    // bellow and will fitted depend on [childAspectRatio],
                    OverlayWidget(
                      color: AppThemes.kBlack.withOpacity(0.3),
                      height: 0.30,
                      width: 0.30,
                    ),

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

                    // bottom overly takes : number of views.
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: OverlayWidget(
                        height: 0.07,
                        width: 1,
                        color: AppThemes.kPrimary.withOpacity(0.7),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            Dimensions.setRadius(
                              context: context,
                              radius: 0.12,
                            ),
                          ),
                          bottomRight: Radius.circular(
                            Dimensions.setRadius(
                              context: context,
                              radius: 0.12,
                            ),
                          ),
                        ),
                        // Move title from right by 0.03 from
                        // and from top by .
                        padding: AppPadding.onlyPaddingGeometry(
                          context: context,
                          right: 0.04,
                          top: 0.01,
                        ),
                        // Title : عدد المشاهدات
                        child: TextWidget(
                          textDirection: TextDirection.rtl,
                          title: '${quotes[index].views} المشاهدات',
                          textColor: AppThemes.kWhite,
                          textOverflow: TextOverflow.ellipsis,
                          textFontSize: Dimensions.setFontDimension(
                            context: context,
                            value: 0.07,
                          ),
                        ),
                      ),
                    ),
                  ],
                ), // Custom card widget
              ),
            ),
          );
        },
      ),
    );
  }
}
