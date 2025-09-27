import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/extentions/extention.dart';
import 'package:islami/core/theme/app_colors.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});
  double angle = 0;

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {



  List<String> azkaar = [
    "سبحان اللّٰه",
    "لا إله إلا اللّٰه",
    "الحمد للّٰه",
    "أستغفر اللّٰه",
    "اللّٰه أكبر",
  ],
  azkaarName = [
    "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
    "أذكر اللّٰه",
    "وَقُلِ الْحَمْدُ لِلَّهِ ",
    "وَاسْتَغْفِرُوا اللَّهَ",
    "وَكَبِّرْهُ تَكْبِيرًا",
  ]
  ;
  int turns = 0, idx = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background_sebha.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/islami_logo.png"),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                azkaarName[idx],
                style: context.appTextTheme.bodyLarge!.copyWith(
                  color: AppColors.white,
                  fontSize: 36,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.angle += 0.1;
                turns++;
                idx = (turns ~/ 32) % 5;
                setState(() {
                  widget.angle;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Stack(
                  alignment: Alignment(0.1, -1),
                  children: [
                    Image.asset("assets/images/sebha_head.png"),
                    Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform.rotate(
                            angle: widget.angle,
                            child: Image.asset("assets/images/sebha_body.png"),
                          ),
                          Text(
                            azkaar[idx],
                            style: context.appTextTheme.bodyLarge!.copyWith(
                              fontSize: 36,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
