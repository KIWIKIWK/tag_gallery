import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';
import 'package:tag_gallery/view/widgets/tag_container_widget.dart';

import '../../models/album.dart';
import '../../provider/album_list_provider.dart';
import '../dialog/add_tag_button.dart';

class AlbumItem extends ConsumerStatefulWidget {
  final int index;
  final Album album;

  const AlbumItem({super.key, required this.index, required this.album});

  @override
  ConsumerState<AlbumItem> createState() => _AlbumItemState();
}

class _AlbumItemState extends ConsumerState<AlbumItem> {
  @override
  Widget build(BuildContext context) {
    final albumList = ref.watch(albumListProvider);

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: backSecondaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: Color(0x4d5c5c5c),
            onTap: () {
              // 세로로 이미지 뷰어
              context.push('/album', extra: widget.album.createdAt);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Image.file(widget.album.thumbnail!.file,
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        Text(
                          "${widget.album.title}",
                          style: TextStyle(color: textColor, fontSize: 20),
                        ),
                        Wrap(
                          spacing: 6,
                          runSpacing: 10,
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          children: [
                            ...widget.album.tags
                                    ?.map(
                                      (tag) => TagContainerWidget(
                                        tag: tag,
                                        albumCreatedAt: widget.album.createdAt,
                                      ),
                                    )
                                    .toList() ??
                                [],
                            AddTagButton(
                              createdAt: widget.album.createdAt,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
