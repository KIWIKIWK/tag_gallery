import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tag_gallery/common/constant/app_colors.dart';
import 'package:tag_gallery/provider/file_list_provider.dart';
import 'package:tag_gallery/view/widgets/appbar_items.dart';
import 'package:tag_gallery/view/widgets/appbar_select_mode.dart';
import '../widgets/bottom_bar_item.dart';
import '../widgets/grid_view_item.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int navIndex = 0;

  void setNavIndex(int index) {
    setState(() {
      navIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fileList = ref.watch(fileListProvider);
    final selectMode = ref.watch(selectModeProvider);

    return Scaffold(
      appBar: selectMode ? AppbarSelectMode() : AppbarItems(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: backColor,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemCount: fileList.length,
          itemBuilder: (context, index) {
            return GridViewItem(
              index: index,
            );
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
