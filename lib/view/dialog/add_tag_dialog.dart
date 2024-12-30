import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';

class AddTagDialog extends StatefulWidget {
  const AddTagDialog({super.key});

  @override
  State<AddTagDialog> createState() => _AddTagDialogState();
}

class _AddTagDialogState extends State<AddTagDialog> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backSecondaryColor,
      title: Text(
        "태그 추가하기",
        style: TextStyle(color: textColor),
      ),
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.only(bottom: 4),
          hintText: "ex) 태그 or 태그1,태그2...",
          hintStyle: TextStyle(color: primaryColor),
        ),
        maxLines: null,
        style: TextStyle(color: primaryColor),
      ),
      actions: [
        TextButton(
            onPressed: () {
              context.pop(); // null 반환
            },
            child: Text(
              "취소",
              style: TextStyle(color: primaryColor, fontSize: 16),
            )),
        TextButton(
            onPressed: () {
              final tags = _textEditingController.text.trim();
              context.pop(tags);
            },
            child: Text(
              "추가",
              style: TextStyle(color: primaryColor, fontSize: 16),
            )),
      ],
    );
  }
}
