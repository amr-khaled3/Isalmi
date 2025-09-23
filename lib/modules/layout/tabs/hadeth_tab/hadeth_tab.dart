import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/HadethScreen.png"),
        ),
      ),
    );
  }
}
