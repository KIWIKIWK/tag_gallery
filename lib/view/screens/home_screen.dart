import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tag_gallery/provider/file_list_provider.dart';
import 'package:tag_gallery/provider/home_navindex_provider.dart';
import 'package:tag_gallery/view/widgets/appbar_items.dart';
import 'package:tag_gallery/view/widgets/appbar_select_mode.dart';
import 'package:tag_gallery/view/widgets/home_body_photo.dart';
import '../widgets/home_body_album.dart';
import '../widgets/home_bottom_navbar.dart';
import '../widgets/home_fab.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final selectMode = ref.watch(selectModeProvider);
    final navIndex = ref.watch(navIndexProvider);

    return Scaffold(
      appBar: selectMode ? AppbarSelectMode() : AppbarItems(),
      body: [HomeBodyPhoto(),HomeBodyAlbum()][navIndex],
      floatingActionButton: navIndex == 1 ? HomeFAB() : null, // 앨범 페이지면 FAB버튼 출력
      bottomNavigationBar: HomeBottomNavbar(),
    );
  }
}
