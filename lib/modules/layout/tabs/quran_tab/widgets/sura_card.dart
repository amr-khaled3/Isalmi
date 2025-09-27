import 'package:flutter/cupertino.dart';
import 'package:islami/core/extentions/extention.dart';
import 'package:islami/core/models/sura.dart';

import '../../../../../core/app_const/app_const.dart';
import '../../../../../core/theme/app_colors.dart';

class SuraCard extends StatelessWidget {
  final Sura sura;
  const SuraCard({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sura_id.png"),
              ),
            ),
            child: Text(
              sura.id.toString(),
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'janna',
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.suraEnglish,
                  style: context.appTextTheme.labelLarge
                ),
                SizedBox(height: 7),
                Text(
                  sura.ayaNumber,
                  style: context.appTextTheme.labelLarge,
                ),
              ],
            ),
          ),
          Text(
            sura.suraArabic,
            style: context.appTextTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
