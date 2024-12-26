import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/medias.dart';

class GridViewItem extends StatefulWidget {
  final int index;

  const GridViewItem({super.key, required this.index});

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        ],
      ),
    );
  }
}
