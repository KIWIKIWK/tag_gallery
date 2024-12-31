import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';
import 'package:tag_gallery/models/album.dart';
import 'package:tag_gallery/provider/album_list_provider.dart';
import 'package:tag_gallery/provider/sort_data_provider.dart';

import '../../models/file_item.dart';
import '../dialog/add_tag_button.dart';
import '../widgets/tag_container_widget.dart';

class AddAlbumScreen extends ConsumerStatefulWidget {
  const AddAlbumScreen({super.key});

  @override
  ConsumerState<AddAlbumScreen> createState() => _AddAlbumScreenState();
}

class _AddAlbumScreenState extends ConsumerState<AddAlbumScreen> {
  late final TextEditingController _titleTextController;
  final Set<String> tags = {};
  List<FileItem> files = [];

  void addTag(Set<String> tag){
    setState(() {
      tags.addAll(tag);
    });
  }

  void removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });
  }

  @override
  void initState() {
    super.initState();
    _titleTextController = TextEditingController();
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sortData = ref.watch(sortDataProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backColor,
        title: Text(
          "앨범 만들기",
          style: TextStyle(color: textColor, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.chevron_left,
            color: textColor,
            size: 36,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final title = _titleTextController.text.trim();
              _titleTextController.clear();
              if(title.isNotEmpty && tags.isNotEmpty && files.isNotEmpty){
                ref.read(albumListProvider.notifier).addAlbum(
                  Album(title: title, tags: tags, files: files),
                );
                ref.read(albumListProvider.notifier).sortAlbum(sortData);
                context.pop();
              }
            },
            icon: Icon(
              Icons.send,
              color: primaryColor,
              size: 24,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: backColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "제목",
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
                Expanded(
                  child: TextField(
                    controller: _titleTextController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: TextStyle(color: primaryColor, fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                spacing: 10,
                children: [
                  Text(
                    "태그",
                    style: TextStyle(color: textColor, fontSize: 18),
                  ),
                  AddTagButton(addTag: addTag,),
                  // Material(
                  //   color: Colors.transparent,
                  //   child: InkWell(
                  //     borderRadius: BorderRadius.circular(15),
                  //     onTap: () async {
                  //       //태그 추가 모달 출력
                  //       final String? result = await showDialog<String>(
                  //         context: context,
                  //         builder: (context) {
                  //           return AddTagDialog();
                  //         },
                  //       );
                  //       if (result != null) {
                  //         setState(() {
                  //           tags.addAll(result.split(','));
                  //         });
                  //       }
                  //       return;
                  //     },
                  //     child: Container(
                  //       child: Icon(
                  //         Icons.add,
                  //         color: primaryColor,
                  //         size: 24,
                  //       ),
                  //       width: 30,
                  //       height: 30,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: primaryColor, width: 2),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Wrap(
              spacing: 6,
              runSpacing: 10,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: tags
                  .map((tag) => TagContainerWidget(
                        tag: tag,
                        removeTag: removeTag,
                      ))
                  .toList(),
            ),
            Row(
              children: [
                Text(
                  "이미지",
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
                TextButton(
                  onPressed: () async {
                    // 직접 가져온 이미지들로 이미지 선택하는 모달 만들어서 이미지 선택하기
                    final result = await FilePicker.platform.pickFiles(
                      allowMultiple: true,
                      type: FileType.media,
                    );
                    if (result != null) {
                      setState(() {
                        files.addAll(result.files
                            .map((file) => FileItem(file: File(file.path!)))
                            .toList());
                      });
                    }
                  },
                  child: Text("이미지 추가하기"),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: files.length,
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        child: InkWell(
                          onTap: () {
                            print("이미지 클릭");
                          },
                          child: Image.file(
                            files[index].file,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              files.remove(files[index]);
                            });
                          },
                          child: Icon(
                            Icons.cancel,
                            color: Color(0xffe30000),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
