import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami/modules/layout/tabs/quran_tab/quran_tab.dart';
import 'package:islami/modules/layout/tabs/radio_tab.dart';
import 'package:islami/modules/layout/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami/modules/layout/tabs/time_tab.dart';

class Home extends StatefulWidget {
  static final String route = 'Home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.secondaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/ic_quran.svg"),
            label: 'Quran',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                "assets/icons/ic_quran.svg",
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/ic_hadeth.svg"),
            label: 'Hadeth',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                "assets/icons/ic_hadeth.svg",
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/ic_sebha.svg"),
            label: 'Sebha',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                "assets/icons/ic_sebha.svg",
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/ic_radio.svg"),
            label: 'Radio',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                "assets/icons/ic_radio.svg",
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/ic_time.svg"),
            label: 'Time',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                "assets/icons/ic_time.svg",
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
      body: tabs[currentIndex],
    );
  }
}
