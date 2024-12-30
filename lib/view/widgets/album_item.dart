import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';
import 'package:tag_gallery/view/widgets/tag_container_widget.dart';

import '../../provider/album_list_provider.dart';

class AlbumItem extends ConsumerStatefulWidget {
  final int index;

  const AlbumItem({super.key, required this.index});

  @override
  ConsumerState<AlbumItem> createState() => _AlbumItemState();
}

class _AlbumItemState extends ConsumerState<AlbumItem> {
  @override
  Widget build(BuildContext context) {
    final albumList = ref.watch(albumListProvider);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: backSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Expanded(
            child: Image.file(albumList[widget.index].thumbnail!.file,
                fit: BoxFit.fitHeight),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${albumList[widget.index].title}",
                  style: TextStyle(color: textColor, fontSize: 20),
                ),
                Wrap(
                  spacing: 6,
                  runSpacing: 10,
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  children: albumList[widget.index]
                          .tags
                          ?.map(
                            (tag) => TagContainerWidget(
                              tag: tag,
                              albumCreatedAt: albumList[widget.index].createdAt,
                            ),
                          )
                          .toList() ??
                      [],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
