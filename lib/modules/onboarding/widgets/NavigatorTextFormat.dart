import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class NavigatorTextFormat extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const NavigatorTextFormat({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
          fontFamily: 'janna',
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
