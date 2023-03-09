import 'package:flutter/widgets.dart';
import 'package:pharmatoday/features/cart/cart_screen.dart';
import 'package:pharmatoday/features/home/app_home_screen.dart';
import 'features/details/details_screen.dart';
import 'features/products/products_screen.dart';
import 'features/screen_success/login_success_screen.dart';
import 'features/sign_in/sign_in_screen.dart';
import 'features/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  //ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SuccessScreen.routeName: (context) => SuccessScreen(),
  //SignUpScreen.routeName: (context) => SignUpScreen(),
  AppHomeScreen.routeName: (context) => AppHomeScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  ProductsScreen.routeName: (context) => ProductsScreen(),

};
