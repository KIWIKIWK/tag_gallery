import 'package:flutter/material.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';

class TagContainerWidget extends StatelessWidget {
  final String tag;
  final Function removeTag;

  const TagContainerWidget(
      {super.key, required this.tag, required this.removeTag});

  @override
  Widget build(BuildContext context) {
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
                removeTag(tag);
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
