import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/theme/app_colors.dart';

import '../../core/models/sura.dart';

class SuraDetails extends StatefulWidget {
  static final String route = 'SuraDetails';
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  Sura? sura;
  String suraDetails = '';
  List<String> ayat = [];

  void readSura(int id) async {
    suraDetails = await rootBundle.loadString('assets/Suras/${id}.txt');
    ayat = suraDetails.trim().split('\n');
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    sura ??= ModalRoute.of(context)!.settings.arguments as Sura;
    if (suraDetails.isEmpty) {
      readSura(sura?.id ?? 0);
    }
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.secondaryColor,
            size: 32,
          ),
        ),
        title: Text(
          sura!.suraEnglish,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryColor,
            fontFamily: 'janna',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/soura_details_screen.png"),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/img_left_corner.png"),
                  Text(
                    sura!.suraArabic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                      fontSize: 32,
                      fontFamily: 'janna',
                    ),
                  ),
                  Image.asset("assets/images/img_right_corner.png"),
                ],
              ),
              Text.rich(
                TextSpan(
                  children: ayat.map((aya) {
                    int idx = ayat.indexOf(aya);
                    return TextSpan(
                      text: aya,
                      children: [
                        TextSpan(
                          text: " [${idx + 1}] ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'janna',
                            color: AppColors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'janna',
                    color: AppColors.secondaryColor,
                    fontSize: 20,
                    height: 2,
                  ),
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
