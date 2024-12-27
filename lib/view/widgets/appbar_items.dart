import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/constant/app_colors.dart';
import '../../provider/search_text_provider.dart';

class AppbarItems extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const AppbarItems({
    super.key,
  });

  @override
  ConsumerState<AppbarItems> createState() => _AppbarItemsState();

  @override
  Size get preferredSize => Size.fromHeight(56);
}

class _AppbarItemsState extends ConsumerState<AppbarItems> {
  late final TextEditingController _searchTextEditingController;

  @override
  void initState() {
    super.initState();
    _searchTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backColor,
      title: Container(
        height: 40,
        child: Stack(
          children: [
            SearchBar(
              controller: _searchTextEditingController,
              onChanged: (text){
                ref.read(searchTextProvider.notifier).state = text.trim();
              },
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
        ),
      ),
    );
  }
}
