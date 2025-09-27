import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/extentions/extention.dart';

import '../../../../../core/models/sura.dart';

class MostRecentSuraCard extends StatelessWidget {
  final Sura sura;
  const MostRecentSuraCard({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.appTheme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sura.suraEnglish,
                style: context.appTextTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 7),
              Text(
                sura.suraArabic,
                style: context.appTextTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 7),
              Text(
              "${sura.ayaNumber} Verses",
                style: context.appTextTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Image.asset("assets/images/moshaf.png"),
        ],
      ),
    );
  }
}
