import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/constant/app_colors.dart';
import '../../provider/home_navindex_provider.dart';

class BottomBarItem extends ConsumerWidget {
  final int index;
  final String itemText;
  const BottomBarItem({super.key, required this.itemText,required this.index});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final navIndex = ref.watch(navIndexProvider);

    return InkWell(
      onTap: (){
        ref.read(navIndexProvider.notifier).setNavIndex(index);
      },
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              border: navIndex == index ? Border(
                bottom: BorderSide(
                  color: primaryColor,
                  width: 2
                )
              ) : null
            ),
            child: Text(
              "$itemText",
              style: TextStyle(
                color: navIndex == index ? primaryColor : primarySecColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
