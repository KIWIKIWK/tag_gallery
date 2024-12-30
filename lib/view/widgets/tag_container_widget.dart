import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';
import 'package:tag_gallery/provider/album_list_provider.dart';

class TagContainerWidget extends ConsumerWidget {
  final DateTime? albumCreatedAt;
  final String tag;
  final Function? removeTag;

  const TagContainerWidget(
      {super.key, required this.tag, this.removeTag, this.albumCreatedAt});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 30,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Text("${tag}", style: TextStyle(color: backColor,fontSize: 16),),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if(removeTag != null){
                  removeTag!(tag);
                } else if(albumCreatedAt != null){
                  ref.read(albumListProvider.notifier).removeTag(albumCreatedAt!, tag);
                }
              },
              child: Container(
                child: Icon(Icons.close,size: 16,)
              ),
            ),
          )
        ],
      ),
    );
  }
}
