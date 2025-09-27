import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/cashing/cashing_keys.dart';
import 'package:islami/core/init_app.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/tabs/quran_tab/quran_tab.dart';
import 'package:islami/modules/onboarding/onboarding.dart';

import '../layout/home.dart';



class SplashScreen extends StatefulWidget {
  static final String route = 'Splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      InitApp.sharedPreferences.getBool(CashingKeys.isFirst) == null ?
      Navigator.pushReplacementNamed(context, Onboarding.route)
          : Navigator.pushReplacementNamed(context, Home.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(height: 100),
          Center(child: Image.asset("assets/images/App_logo.png")),
          Spacer(),
          SafeArea(
            child: Image.asset("assets/images/Route_logo.png", width: 250),
          ),
        ],
      ),
    );
  }
}
