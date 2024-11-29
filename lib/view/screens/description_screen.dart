import 'package:abu_sandia/constants/padding/app_padding_dimensions.dart';
import 'package:abu_sandia/controller/cubits/cubit_instance_helper/cubit_instance.dart';
import 'package:abu_sandia/controller/cubits/user_cache_cubit/user_cache_cubit.dart';
import 'package:abu_sandia/responsiveness/responsive_component/app_padding.dart';
import 'package:abu_sandia/responsiveness/responsive_component/box.dart';
import 'package:abu_sandia/routes/app_routes.dart';
import 'package:abu_sandia/routes/navigation.dart';
import 'package:abu_sandia/view/widgets/abu_sandia_picture.dart';
import 'package:abu_sandia/view/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/themes/app_themes.dart';
import '../../responsiveness/responsive_component/Dimensions.dart';
import '../widgets/text_widget.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserCacheCubit userCacheCubit =
        CubitInstance<UserCacheCubit>().cubitInstance(context: context);
    return Scaffold(
      body: AppPadding.symmetricPadding(
        context: context,
        horizontal: AppPaddingDimensions.horizontalPadding,
        vertical: AppPaddingDimensions.verticalPadding,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            // V.space from the top.
            Box.verticalBox(context: context, height: 0.05),

            // Picture of the "Raki: Ayoub abu sandia".
            AbuSandiaPicture(
              alignment: Alignment.topRight,
            ),

            // A short cut about "Raki: Ayoub abu sandia".
            Expanded(
              flex: 3,
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
                    title:
                        " أيوب أبو ساندية هو معالج روحاني وراقي شرعي يعمل في مجال الرقية الشرعية، وهو معروف في بعض الأوساط العربية بقدرته على تقديم العلاجات الروحانية وفق التعاليم الإسلامية. يستخدم في جلسات الرقية القرآن الكريم والأدعية والأذكار النبوية، ويؤكد على أهمية الالتزام بالشريعة والابتعاد عن الممارسات التي قد تتعارض مع العقيدة الإسلامية، مثل السحر أو الشعوذة."
                        "\n غالبًا ما يشدد أيوب أبو ساندية على ضرورة التحصين بالأذكار اليومية والمواظبة على قراءة القرآن، ويدعو الأشخاص الراغبين في العلاج إلى اليقين بالله والابتعاد عن الأمور التي تضعف الإيمان.",
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

            // V.space
            Box.verticalBox(context: context, height: 0.02),

            // Button : continue.
            BlocBuilder<UserCacheCubit, UserCacheState>(
                builder: (context, state) {
              if (state is UserCacheLoadingState) {
                return Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    ElevatedButtonWidget(
                      onPressed: () {
                        // Set a dummy userId to cache.
                        userCacheCubit.setUserID(userId: 'userId');
                        // Jumping to 'homeScreen'.
                        Navigation.pushReplacementNamedNavigator(
                          context: context,
                          page: AppRoutes.homeScreen,
                        );
                      },
                      child: TextWidget(
                        title: 'متابعة',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        textColor: AppThemes.kWhite,
                        textFontWeight: FontWeight.bold,
                        textFontSize: Dimensions.setFontDimension(
                          context: context,
                          value: 0.10,
                        ),
                      ),
                    ),
                    // Circular indicator
                    const Positioned.fill(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppThemes.kWhite,
                        ),
                      ),
                    )
                  ],
                );
              }
              return ElevatedButtonWidget(
                onPressed: ()async{
                  // Set a dummy userId to cache.
                   await userCacheCubit.setUserID(userId: 'userId');
                  // Jumping to 'homeScreen'.
                   if(context.mounted) {
                     Navigation.pushReplacementNamedNavigator(
                    context: context,
                    page: AppRoutes.homeScreen,
                  );
                   }
                },
                child: TextWidget(
                  title: 'متابعة',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  textColor: AppThemes.kWhite,
                  textFontWeight: FontWeight.bold,
                  textFontSize: Dimensions.setFontDimension(
                    context: context,
                    value: 0.10,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
