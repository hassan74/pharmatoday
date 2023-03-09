import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmatoday/app_theme.dart';
import 'package:pharmatoday/features/cart/CartProvider.dart';
import 'package:pharmatoday/features/splash/components/body.dart';
import 'package:pharmatoday/features/splash/splash_screen.dart';
import 'package:pharmatoday/routes.dart';
import 'package:provider/provider.dart';
import 'features/home/app_home_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'features/sign_in/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:  Color(0xFF2633C5),
        textTheme: MyAppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
     /* supportedLocales: [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],*/
     // locale:  Locale("ar", "AE"),
      //home: AppHomeScreen(),
      home: SplashScreen(),
      routes: routes,
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
