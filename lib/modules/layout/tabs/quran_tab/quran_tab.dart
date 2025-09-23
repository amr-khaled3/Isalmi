import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/models/sura.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/tabs/quran_tab/widgets/search_quran_text_filed.dart';
import 'package:islami/modules/layout/tabs/quran_tab/widgets/sura_card.dart';
import 'package:islami/modules/sura_details/suar_details.dart';

import '../../../../core/app_const/app_const.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  TextEditingController search = TextEditingController();
  List<Sura> quran = [], searched = [];
  @override
  void initState() {
    super.initState();
    redQuran();
    search.addListener(() {
      if (search.text.isEmpty) {
        searched = quran;
      } else {
        searched = quran
            .where(
              (sura) =>
                  sura.suraEnglish.trim().toLowerCase().contains(
                    search.text.trim().toLowerCase(),
                  ) ||
                  sura.suraArabic.trim().contains(search.text.trim()),
            )
            .toList();
      }
      setState(() {});
    });
  }

  void redQuran() {
    int n = arabicAuranSuras.length;
    for (int i = 0; i < n; i++) {
      quran.add(
        Sura(
          id: i + 1,
          suraEnglish: englishQuranSuras[i],
          suraArabic: arabicAuranSuras[i],
          ayaNumber: AyaNumber[i],
        ),
      );
    }
    searched = quran;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/HomeScreen.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SafeArea(
              child: Image.asset("assets/images/islami_logo.png"),
            ),
          ),
          SearchQuranTextFiled(controller: search),
          SizedBox(height: 20),
          Text(
            "Suras List",
            style: TextStyle(
              color: AppColors.white,
              fontFamily: 'janna',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: searched.length,
              itemBuilder: (_, index) =>
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, SuraDetails.route, arguments: searched[index]);
                    },
                    child: SuraCard(sura: searched[index])
                  ),
              separatorBuilder: (context, index) =>
                  Divider(indent: 20, endIndent: 20),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
}
