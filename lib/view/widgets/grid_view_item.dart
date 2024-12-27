import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';

import '../../provider/file_list_provider.dart';

class GridViewItem extends ConsumerStatefulWidget {
  final int index;

  const GridViewItem({super.key, required this.index});

  @override
  ConsumerState<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends ConsumerState<GridViewItem> {

  @override
  Widget build(BuildContext context) {
    final fileList = ref.watch(fileItemListProvider);
    final selectMode = ref.watch(selectModeProvider);

    return GestureDetector(
      onLongPress: () {
       ref.read(selectModeProvider.notifier).toggleSelectMode();
       ref.read(fileItemListProvider.notifier).toggleFileSelected(widget.index);
      },
      onTap: () {
        if(selectMode){
          ref.read(fileItemListProvider.notifier).toggleFileSelected(widget.index);
        } else{
          context.push('/photo', extra: widget.index);
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            child: Image.file(
              fileList[widget.index].file,
              fit: BoxFit.cover,
            ),
          ),
          if(fileList[widget.index].selected)
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: primaryColor
              ),
              child: Center(child: Icon(Icons.check,size: 24,)),
            ),
          ),
        ],
      ),
    );
  }
}

