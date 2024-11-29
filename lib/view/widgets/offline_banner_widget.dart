import 'package:abu_sandia/constants/themes/app_themes.dart';
import 'package:abu_sandia/controller/cubits/internet_cubit/connection_cubit.dart';
import 'package:abu_sandia/responsiveness/responsive_component/Dimensions.dart';
import 'package:abu_sandia/view/screens/home_screen.dart';
import 'package:abu_sandia/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/splash_screen.dart';

class OfflineBannerWidget extends StatelessWidget {
  final Widget child;

  const OfflineBannerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    bool isDisconnected =
        context.watch<ConnectionCubit>().state
            == ConnectionStatus.disconnected;
    return Scaffold(
      body: Stack(
        children: [
          child, // The main app content
          if (isDisconnected)
            Container(
              color: AppThemes.kBlack.withOpacity(0.5),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.wifi_off,
                      size: 60,
                      color: AppThemes.kPrimary,
                    ),
                    SizedBox(height: 10),
                    TextWidget(
                      title: 'لاتوجد تغطية الأنترنت',
                      textDirection: TextDirection.rtl,
                      textOverflow: TextOverflow.visible,
                      textFontSize: Dimensions.setFontDimension(
                        context: context,
                        value: 0.10,
                      ),
                      textColor: AppThemes.kPrimary,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
