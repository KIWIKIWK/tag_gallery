import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../models/medias.dart';

class PhotoViewScreen extends StatefulWidget {
  final int index;

  const PhotoViewScreen({super.key, required this.index});

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  late final PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: widget.index);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        itemCount: Media.instance.files.length,
        builder: (context, idx) {
          return PhotoViewGalleryPageOptions(
            imageProvider: FileImage(
              Media.instance.files[idx],
            ),
          );
        },
        pageController: _pageController,
      ),
    );
  }
}
