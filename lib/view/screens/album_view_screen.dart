import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';

import '../../provider/album_list_provider.dart';

class AlbumViewScreen extends ConsumerStatefulWidget {
  final DateTime createdAt;

  const AlbumViewScreen({super.key, required this.createdAt});

  @override
  ConsumerState<AlbumViewScreen> createState() => _AlbumViewScreenState();
}

class _AlbumViewScreenState extends ConsumerState<AlbumViewScreen> {
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
    final album =
        albumList.where((album) => album.createdAt == widget.createdAt).first;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backColor,
        title: Text(
          "${album.title}",
          style: TextStyle(color: textColor, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.chevron_left,
            size: 30,
            color: textColor,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: backColor,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          itemCount: album.files.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                context.push('/photo?currentIndex=${index}',extra: album);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Image.file(
                  album.files[index].file,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
