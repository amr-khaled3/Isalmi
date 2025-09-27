import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/app_const/app_const.dart';
import 'package:islami/core/cashing/cashing_keys.dart';
import 'package:islami/core/extentions/extention.dart';
import 'package:islami/core/init_app.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/home.dart';
import 'package:islami/modules/onboarding/widgets/NavigatorTextFormat.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static final String route = "onboarding";

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController();
  int _currentPage = 0;
  
  @override
  void initState() {
    InitApp.sharedPreferences.setBool(CashingKeys.isFirst, false);
    super.initState();
  }
  
  void _getNextCard() async{
    if (_currentPage < onboardingImages.length - 1) {
      await pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 700),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, Home.route);
    }
  }

  void _getPreviousCard() {
    if (_currentPage > 0) {
      pageController.animateToPage(
        _currentPage - 1,
        duration: Duration(milliseconds: 700),
        curve: Curves.easeIn,
      );
    }
  }


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset("assets/images/islami_logo.png"),
            ),

            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: onboardingImages.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Image.asset(onboardingImages[index]),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            onboardingTextImage[index],
                            style: context.appTextTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            onboardingTextInfo[index],
                            style: context.appTextTheme.bodyMedium!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: context.appTheme.colorScheme.secondary
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage > 0
                      ? NavigatorTextFormat(
                    text: "Back",
                    onTap: _getPreviousCard,
                  )
                      : const SizedBox(width: 35),
                  // Page indicators
                  Row(
                    children: [
                      for (int i = 0; i < onboardingImages.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 11),
                          child: Container(
                            height: 7,
                            width: i == _currentPage ? 14 : 7,
                            decoration: BoxDecoration(
                              color: i == _currentPage
                                  ? AppColors.secondaryColor
                                  : const Color(0xff707070),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                    ],
                  ),

                  // Next/Finish button
                  NavigatorTextFormat(
                    text: _currentPage < onboardingImages.length - 1
                        ? "Next"
                        : "Finish",
                    onTap: _getNextCard,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
