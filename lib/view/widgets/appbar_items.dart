import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tag_gallery/common/constant/sort_constant.dart';
import 'package:tag_gallery/provider/file_list_provider.dart';
import 'package:tag_gallery/provider/home_navindex_provider.dart';
import 'package:tag_gallery/provider/sort_data_provider.dart';

import '../../common/constant/app_colors.dart';
import '../../provider/search_text_provider.dart';

class AppbarItems extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
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
    final searchText = ref.watch(searchTextProvider);
    _searchTextEditingController.text = searchText;
    final navIndex = ref.watch(navIndexProvider);
    final sortData = ref.watch(sortDataProvider);
    final albumSearchType = ref.watch(albumSearchTypeProvider);

    return AppBar(
      backgroundColor: backColor,
      title: Container(
        height: 40,
        child: Stack(
          children: [
            SearchBar(
              controller: _searchTextEditingController,
              onChanged: (text) {
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
              hintText: navIndex == 0 ? "Search to name" : albumSearchType == 'title' ? "Search to title" : "Search to tag",
              hintStyle: WidgetStatePropertyAll(
                TextStyle(color: textSecColor, fontSize: 18),
              ),
              textStyle: WidgetStatePropertyAll(
                  TextStyle(color: textColor, fontSize: 18)),
            ),
            if (navIndex == 1)
              Positioned(
                right: 80,
                bottom: -4,
                child: IconButton(onPressed: (){
                  setState(() {
                    if(albumSearchType == 'title'){
                      ref.read(albumSearchTypeProvider.notifier).state = 'tag';
                    } else{
                      ref.read(albumSearchTypeProvider.notifier).state = 'title';
                    }
                  });
                }, icon: Icon(albumSearchType == 'title' ? Icons.title : Icons.text_fields,color: primaryColor,))
              ),
            Positioned(
              right: 40,
              bottom: -4,
              child: PopupMenuButton(
                color: backSecondaryColor,
                menuPadding: EdgeInsets.zero,
                itemBuilder: (context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    onTap: () {
                      ref.read(sortDataProvider.notifier).updateSortType(SortType.date,ref);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (sortData.sortType == SortType.date)
                          Icon(
                            Icons.check,
                            color: primaryColor,
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "날짜",
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      ref.read(sortDataProvider.notifier).updateSortType(SortType.name,ref);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (sortData.sortType == SortType.name)
                          Icon(
                            Icons.check,
                            color: primaryColor,
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "이름",
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    onTap: () {
                      ref.read(sortDataProvider.notifier).updateSortOrder(SortOrder.desc,ref);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (sortData.sortOrder == SortOrder.desc)
                          Icon(
                            Icons.check,
                            color: primaryColor,
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "내림차순",
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      ref.read(sortDataProvider.notifier).updateSortOrder(SortOrder.asc,ref);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (sortData.sortOrder == SortOrder.asc)
                          Icon(
                            Icons.check,
                            color: primaryColor,
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "오름차순",
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                  ),
                ],
                icon: Icon(
                  Icons.sort,
                  color: primaryColor,
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton(
                  color: backSecondaryColor,
                  menuPadding: EdgeInsets.zero,
                  itemBuilder: (context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      onTap: () {
                        ref
                            .read(selectModeProvider.notifier)
                            .toggleSelectMode();
                      },
                      child: Text(
                        "선택하기",
                        style: TextStyle(color: textColor),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        ref
                            .read(selectModeProvider.notifier)
                            .toggleSelectMode();
                        ref.read(fileItemListProvider.notifier).selectAllFile();
                      },
                      child: Text(
                        "모두 선택",
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
