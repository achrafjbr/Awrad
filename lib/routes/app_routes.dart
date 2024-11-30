
import 'package:abu_sandia/view/screens/description_screen.dart';
import 'package:abu_sandia/view/screens/home_screen.dart';
import 'package:abu_sandia/view/screens/quotes_categories_screen.dart';
import 'package:abu_sandia/view/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes{


  static const splashScreen = '/splashScreen';
  static const descriptionScreen = '/descriptionScreen';
  static const homeScreen = '/homeScreen';
  static const quotesCategoriesScreen  = '/quotesCategoriesScreen';
  static const quoteScreen  = '/quoteScreen';




  static Map<String, Widget Function(BuildContext)>
  routes = {

    splashScreen: (context) =>  const SplashScreen(),
    descriptionScreen: (context) =>  const DescriptionScreen(),
    homeScreen: (context) =>  const HomeScreen(),
    quotesCategoriesScreen: (context) =>  const QuotesCategoriesScreen(category: '',),
   // quoteScreen: (context) =>  const QuoteScreen(quote: null,),




  };
}