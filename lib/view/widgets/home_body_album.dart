import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tag_gallery/provider/album_list_provider.dart';

import '../../common/constant/app_colors.dart';
import 'album_item.dart';

class HomeBodyAlbum extends ConsumerStatefulWidget {
  const HomeBodyAlbum({super.key});

  @override
  ConsumerState<HomeBodyAlbum> createState() => _HomeBodyAlbumState();
}

class _HomeBodyAlbumState extends ConsumerState<HomeBodyAlbum> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final albumList = ref.watch(albumListProvider);

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        color: backColor,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          itemCount: albumList.length,
          itemBuilder: (context, index) {
            return AlbumItem(index:index);
          },
        ));
  }
}
