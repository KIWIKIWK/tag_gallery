import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/constant/app_colors.dart';
import 'bottom_bar_item.dart';

class HomeBottomNavbar extends ConsumerStatefulWidget {
  const HomeBottomNavbar({super.key});

  @override
  ConsumerState<HomeBottomNavbar> createState() => _HomeBottomNavbarState();
}

class _HomeBottomNavbarState extends ConsumerState<HomeBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      color: backColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomBarItem(
            itemText: "사진",
            index: 0,
          ),
          BottomBarItem(
            itemText: "앨범",
            index: 1,
          ),
        ],
      ),
    );
  }
}
