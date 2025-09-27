import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/extentions/extention.dart';
import 'package:islami/core/models/hadeth.dart';
import 'package:islami/core/theme/app_colors.dart';



class HadethDetails extends StatefulWidget {
  static final String route = 'HadethDetails';
  HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<HadethDetails> {
  Hadeth? hadeth;
  String suraDetails = '';
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    hadeth ??= ModalRoute.of(context)!.settings.arguments as Hadeth;

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
          "Hadeeth${hadeth!.hadeethIndex}",
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
                    hadeth!.title,
                    style: context.appTextTheme.bodyLarge!.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  Image.asset("assets/images/img_right_corner.png"),
                ],
              ),
              Text.rich(
                TextSpan(
                  text: hadeth!.content,
                  style: context.appTextTheme.labelLarge!.copyWith(
                      height: 2,
                      color: context.appTheme.colorScheme.secondary
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
