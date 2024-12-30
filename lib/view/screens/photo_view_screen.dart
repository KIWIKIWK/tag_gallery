import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';
import 'package:tag_gallery/models/file_item.dart';

import '../../models/album.dart';
import '../../provider/file_list_provider.dart';

class PhotoViewScreen extends ConsumerStatefulWidget {
  final int currentIndex;
  final Album? album;
  const PhotoViewScreen({super.key, required this.currentIndex, this.album});

  @override
  ConsumerState<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends ConsumerState<PhotoViewScreen> {
  late final PageController _pageController;
  late int currentPageIndex;
  late final List<FileItem> fileList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
    currentPageIndex = widget.currentIndex;
    if(widget.album == null){
      fileList = ref.watch(fileItemListProvider);
    } else{
      fileList = widget.album!.files;
    }
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
            itemCount: fileList.length,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            builder: (context, idx) {
              return PhotoViewGalleryPageOptions(
                imageProvider: FileImage(
                  fileList[idx].file,
                ),
              );
            },
            loadingBuilder: (context, event) => Container(
              // 이미지 로딩중일때 화면
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            pageController: _pageController,
          ),
          Positioned(
            // 상단에 메뉴들이랑 사진 제목 나오는곳
            top: 0,
            child: SafeArea(
              child: Container(
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
                    ),
                    Expanded(
                      child: Text(
                        "${fileList[currentPageIndex].contractionFileName}",
                        style: TextStyle(color: textColor, fontSize: 18),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //파일 정보들 보여주는 다이얼로그 띄어줌.
                      },
                      icon: Icon(
                        Icons.info_outline,
                        color: textColor,
                      ),
                    ),
                    PopupMenuButton(
                      color: backSecondaryColor,
                      menuPadding: EdgeInsets.zero,
                      itemBuilder: (context) => <PopupMenuEntry>[
                        PopupMenuItem(
                          child: Text(
                            "이름 변경",
                            style: TextStyle(color: textColor),
                          ),
                        ),
                        PopupMenuItem(
                          child: Text(
                            "삭제하기",
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      ],
                      icon: Icon(
                        Icons.more_vert_outlined,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            // 하단 바 부분
            bottom: 0,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${currentPageIndex}",
                      style: TextStyle(color: textColor, fontSize: 24),
                    ),
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
