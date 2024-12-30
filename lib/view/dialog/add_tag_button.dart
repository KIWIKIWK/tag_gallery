import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tag_gallery/provider/album_list_provider.dart';

import '../../common/constant/app_colors.dart';
import 'add_tag_dialog.dart';

class AddTagButton extends ConsumerWidget {
  final DateTime? createdAt;
  final Function? addTag;
  const AddTagButton({super.key, this.addTag,this.createdAt});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () async {
          //태그 추가 모달 출력
          final String? result = await showDialog<String>(
            context: context,
            builder: (context) {
              return AddTagDialog();
            },
          );
          if (result != null) {
            final tags = result.split(',').toSet();
            if(addTag != null){
              addTag!(tags);
            } else if(createdAt!=null){
              ref.read(albumListProvider.notifier).addTag(createdAt!, tags);
            }
          }
          return;
        },
        child: Container(
          child: Icon(
            Icons.add,
            color: primaryColor,
            size: 20,
          ),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
