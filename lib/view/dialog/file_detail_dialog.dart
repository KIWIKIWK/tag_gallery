import 'package:flutter/material.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';

import '../../models/file_item.dart';

class FileDetailDialog extends StatelessWidget {
  final FileItem fileItem;

  const FileDetailDialog({super.key, required this.fileItem});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: backColor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("정보", style: TextStyle(color: textColor,fontSize: 22),),
              ),
              Text(
                "이름",
                style: TextStyle(color: textColor, fontSize: 16),
              ),
              Text("${fileItem.fileName}.${fileItem.fileExtension}", style: TextStyle(color: primaryColor,fontSize: 14),),
              SizedBox(height: 10,),
              Text(
                "경로",
                style: TextStyle(color: textColor, fontSize: 16),
              ),
              Text(fileItem.filePath, style: TextStyle(color: primaryColor,fontSize: 14),),
              SizedBox(height: 10,),
              Text(
                "최종 수정날짜",
                style: TextStyle(color: textColor, fontSize: 16),
              ),
              Text("${fileItem.modifiedDate}", style: TextStyle(color: primaryColor,fontSize: 14),),
              SizedBox(height: 10,),
              Text(
                "파일 크기",
                style: TextStyle(color: textColor, fontSize: 16),
              ),
              Text("${fileItem.fileSize}", style: TextStyle(color: primaryColor,fontSize: 14),),
            ],
          ),
        ));
  }
}
