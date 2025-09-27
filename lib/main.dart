import 'package:flutter/material.dart';
import 'package:islami/core/init_app.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/modules/layout/home.dart';
import 'package:islami/modules/onboarding/onboarding.dart';
import 'package:islami/modules/sura_details/suar_details.dart';

import 'modules/hadeth_details/hadeth_details.dart';

import 'modules/splash_screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await InitApp.initApp();
  runApp(const Islami());
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (context) => SplashScreen(),
        Home.route: (context) => Home(),
        SuraDetails.route: (context) => SuraDetails(),
        Onboarding.route: (context) => Onboarding(),
        HadethDetails.route: (context) => HadethDetails()
      },
      home: SplashScreen(),
      darkTheme: AppTheme.darkThem,
      themeMode:ThemeMode.dark,
    );
  }
}




