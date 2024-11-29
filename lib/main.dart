import 'package:abu_sandia/constants/themes/app_themes.dart';
import 'package:abu_sandia/constants/users/user.dart';
import 'package:abu_sandia/controller/cubits/categories_cubit/category_cubit.dart';
import 'package:abu_sandia/controller/cubits/quotes_cubit/quote_cubit.dart';
import 'package:abu_sandia/controller/cubits/user_cache_cubit/user_cache_cubit.dart';
import 'package:abu_sandia/routes/app_routes.dart';
import 'package:abu_sandia/utils/user_caching/user_cache.dart';
import 'package:abu_sandia/view/screens/connection_listener.dart';
import 'package:abu_sandia/view/screens/home_screen.dart';
import 'package:abu_sandia/view/screens/splash_screen.dart';
import 'package:abu_sandia/view/widgets/offline_banner_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/cubits/internet_cubit/connection_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  User.userID = (await UserCache.getCacheUserId());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectionCubit>(
          create: (context) => ConnectionCubit(
            Connectivity(),
          ),
        ),
        BlocProvider<UserCacheCubit>(create: (context) => UserCacheCubit()),
        BlocProvider<CategoryCubit>(create: (context) => CategoryCubit()),
        BlocProvider<QuoteCubit>(create: (context) => QuoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            shadowColor: AppThemes.kPrimary,
          ),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppThemes.kPrimary,
            surface: AppThemes.kPrimaryBackgroundScreen,
          ),
        ),
        routes: AppRoutes.routes,
        home: SplashScreen(),
      ),
    );
  }
}
