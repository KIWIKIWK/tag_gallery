import 'package:flutter/material.dart';

import '../../common/constant/app_colors.dart';

class BottomBarItem extends StatelessWidget {
  final int index;
  final String itemText;
  final Function setIndex;
  const BottomBarItem({super.key, required this.itemText,required this.setIndex, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setIndex(index);
      },
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            "$itemText",
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
