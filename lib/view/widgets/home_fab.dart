import 'package:flutter/material.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';

class HomeFAB extends StatelessWidget {
  const HomeFAB({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      width: 70,
      height: 70,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        backgroundColor: primaryColor,
        onPressed: () {
        },
        child: Icon(
          Icons.add,
          size: 24,
          color: primarySecColor,
        ),
      ),
    );
  }
}
