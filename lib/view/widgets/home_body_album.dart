import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/constant/app_colors.dart';

class HomeBodyAlbum extends ConsumerStatefulWidget {
  const HomeBodyAlbum({super.key});

  @override
  ConsumerState<HomeBodyAlbum> createState() => _HomeBodyAlbumState();
}

class _HomeBodyAlbumState extends ConsumerState<HomeBodyAlbum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: backColor,
      child: Center(
        child: Text("앨범",style: TextStyle(color: textColor,fontSize: 20),),
      ),
    );
  }
}
