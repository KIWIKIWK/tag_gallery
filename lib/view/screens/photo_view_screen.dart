import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';

import '../../models/medias.dart';

class PhotoViewScreen extends StatefulWidget {
  final int currentIndex;

  const PhotoViewScreen({super.key, required this.currentIndex});

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  late final PageController _pageController;
  late int currentPageIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
    currentPageIndex = widget.currentIndex;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            itemCount: Media.instance.files.length,
            onPageChanged: (index){
              setState(() {
                currentPageIndex = index;
              });
            },
            builder: (context, idx) {
              return PhotoViewGalleryPageOptions(
                imageProvider: FileImage(
                  Media.instance.files[idx],
                ),
              );
            },
            pageController: _pageController,
          ),
          Positioned(
            top: 0,
            child: SafeArea(
              child: Container(
                // 상단에 메뉴들이랑 사진 제목 나오는곳
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        size: 36,
                        color: textColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${currentPageIndex}",style: TextStyle(color: textColor,fontSize: 24),),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
