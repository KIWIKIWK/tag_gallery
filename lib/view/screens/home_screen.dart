import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';
import 'package:tag_gallery/models/app_infos.dart';

import '../../models/medias.dart';
import '../widgets/bottom_bar_item.dart';
import '../widgets/grid_view_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Media media = Media.instance;
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
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Icon(
                Icons.search,
                color: primaryColor,
              ),
            ),
          ),
          height: 40,
        ),
        backgroundColor: backColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: backColor,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10),
          itemCount: media.files.length,
          itemBuilder: (context, index) {
            return GridViewItem(index: index);
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: backColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomBarItem(
              itemText: "사진",
              setIndex: setNavIndex,
              index: 0,
              navIndex: navIndex,
            ),
            BottomBarItem(
              itemText: "앨범",
              setIndex: setNavIndex,
              index: 1,
              navIndex: navIndex,
            ),
          ],
        ),
      ),
    );
  }
}
