import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';

import '../../models/medias.dart';

class GridViewItem extends StatefulWidget {
  final int index;

  const GridViewItem({super.key, required this.index});

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // 해당 사진 선택되면서 편집모드 진입
        setState(() {
          selected = true;
        });
      },
      onTap: () {
        context.push('/photo', extra: widget.index);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            child: Image.file(
              Media.instance.files[widget.index],
              fit: BoxFit.cover,
            ),
          ),
          if(selected)
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
