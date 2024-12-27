import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tag_gallery/provider/search_text_provider.dart';

import '../../common/constant/app_colors.dart';
import '../../provider/file_list_provider.dart';
import 'grid_view_item.dart';

class HomeBodyPhoto extends ConsumerStatefulWidget {
  const HomeBodyPhoto({super.key});

  @override
  ConsumerState<HomeBodyPhoto> createState() => _HomeBodyPhotoState();
}

class _HomeBodyPhotoState extends ConsumerState<HomeBodyPhoto> {
  @override
  Widget build(BuildContext context) {
    final fileList = ref.watch(fileItemListProvider);
    final searchText = ref.watch(searchTextProvider);

    return Container(
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
    );
  }
}
