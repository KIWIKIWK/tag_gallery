import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';

import '../widgets/bottom_bar_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int navIndex = 0;

  void setNavIndex(int index) {
    setState(() {
      navIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: SearchBar(
            backgroundColor: WidgetStatePropertyAll(primarySecColor),
          ),
          height: 40,
        ),
        backgroundColor: backColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: backColor,
        child: Center(
          child: Text(
            "$navIndex",
            style: TextStyle(color: textColor),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: backColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomBarItem(
              itemText: "사진",
              setIndex: setNavIndex,
              index: 0,
            ),
            BottomBarItem(
              itemText: "미디어",
              setIndex: setNavIndex,
              index: 1,
            ),
          ],
        ),
      ),
    );
  }
}
