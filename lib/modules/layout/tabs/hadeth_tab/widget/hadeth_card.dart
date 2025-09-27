import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/extentions/extention.dart';
import 'package:islami/core/models/hadeth.dart';

class HadethCard extends StatelessWidget {
  final Hadeth hadeeth;
  const HadethCard({super.key, required this.hadeeth});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadith_card.png"),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.ltr,
                children: [
                  Image.asset(
                    "assets/images/img_left_corner.png",
                    color: Colors.black,
                  ),
                  Text(
                    hadeeth.title,
                    style: context.appTextTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Image.asset(
                    "assets/images/img_right_corner.png",
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1.7),
              child: Text(
                hadeeth.content,
                style: context.appTextTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 19,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
