import 'package:flutter/material.dart';

import '../../common/constant/app_colors.dart';

class AppbarItems extends StatelessWidget {
  const AppbarItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SearchBar(
          padding: WidgetStatePropertyAll(EdgeInsets.only(right: 50)),
          backgroundColor: WidgetStatePropertyAll(primarySecColor),
          leading: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Icon(
              Icons.search,
              color: primaryColor,
            ),
          ),
          hintText: "Search Files",
          hintStyle: WidgetStatePropertyAll(
            TextStyle(color: textSecColor, fontSize: 18),
          ),
          textStyle:
              WidgetStatePropertyAll(TextStyle(color: textColor, fontSize: 18)),
        ),
        Positioned(
          child: Align(
            alignment: Alignment.centerRight,
            child: PopupMenuButton(
              color: backSecondaryColor,
              menuPadding: EdgeInsets.zero,
              itemBuilder: (context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: Text(
                    "편집",
                    style: TextStyle(color: textColor),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    "awdawd",
                    style: TextStyle(color: textColor),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    "awdawd",
                    style: TextStyle(color: textColor),
                  ),
                ),
              ],
              icon: Icon(
                Icons.more_vert_outlined,
                color: primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
