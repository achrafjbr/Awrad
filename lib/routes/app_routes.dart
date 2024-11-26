
import 'package:abu_sandia/view/screens/description_screen.dart';
import 'package:abu_sandia/view/screens/home_screen.dart';
import 'package:abu_sandia/view/screens/quote_screen.dart';
import 'package:abu_sandia/view/screens/quotes_categories_screen.dart';
import 'package:abu_sandia/view/screens/sign_up_screen.dart';
import 'package:abu_sandia/view/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes{


  static const splashScreen = '/splashScreen';
  static const descriptionScreen = '/descriptionScreen';
  static const homeScreen = '/homeScreen';
  static const quotesCategoriesScreen  = '/quotesCategoriesScreen';
  static const quoteScreen  = '/quoteScreen';

  // I'll think about these if i'll create them for our project or not.
  static const signUpScreen  = '/signUpScreen';
  static const signInScreen  = '/signInScreen';



  static Map<String, Widget Function(BuildContext)>
  routes = {

    splashScreen: (context) =>  const SplashScreen(),
    descriptionScreen: (context) =>  const DescriptionScreen(),
    homeScreen: (context) =>  const HomeScreen(),
    quotesCategoriesScreen: (context) =>  const QuotesCategoriesScreen(category: '',),
   // quoteScreen: (context) =>  const QuoteScreen(quote: null,),

    // I'll think about these if i'll create them for our project or not.
    signUpScreen: (context) =>  const SignUpScreen(),
    signInScreen: (context) =>  const SignUpScreen(),



  };
}