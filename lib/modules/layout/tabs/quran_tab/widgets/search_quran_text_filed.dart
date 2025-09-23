import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_colors.dart';

class SearchQuranTextFiled extends StatelessWidget {
  final TextEditingController controller;
  const SearchQuranTextFiled({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.white,
      style: TextStyle(color: AppColors.white, fontFamily: 'janna'),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
          ),
          fillColor: AppColors.primaryColor.withValues(alpha: 0.5),
          filled: true,
          hintText: 'Sura Name',
          hintStyle: TextStyle(color: AppColors.white, fontFamily: 'janna'),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset("assets/icons/ic_quran.svg", colorFilter:ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),),
          )
      ),
    );
  }
}
