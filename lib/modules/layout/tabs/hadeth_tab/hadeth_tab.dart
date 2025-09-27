import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/extentions/extention.dart';
import 'package:islami/core/models/hadeth.dart';
import 'package:islami/modules/layout/tabs/hadeth_tab/widget/hadeth_card.dart';

import '../../../hadeth_details/hadeth_details.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadethContent = [];

  @override
  Widget build(BuildContext context) {
    if (hadethContent.isEmpty) {
      readHadeth();
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/HadethScreen.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/islami_logo.png"),
            hadethContent.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: CarouselSlider(
                      items: hadethContent.map((hadeeth) {
                        return InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, HadethDetails.route, arguments: hadeeth);
                            },
                            child: HadethCard(hadeeth: hadeeth)
                        );
                      }).toList(),
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: double.infinity,
                        // enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void readHadeth() async {
    for (int i = 1; i <= 50; i++) {
      String hadeth = await rootBundle.loadString('assets/Hadeeth/h$i.txt');
      List<String> hadethList = hadeth.trim().split('\n');
      hadethContent.add(
        Hadeth(
          title: hadethList[0],
          content: hadethList[1],
          hadeethIndex: i.toString(),
        ),
      );
    }
    setState(() {});
  }
}
