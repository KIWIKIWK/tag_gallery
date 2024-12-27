import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tag_gallery/common/constant/app_colors.dart';
import 'package:tag_gallery/services/file_list_methods.dart';

import '../../provider/file_list_provider.dart';

class AppbarSelectMode extends ConsumerWidget implements PreferredSizeWidget {
  const AppbarSelectMode({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileListState = ref.watch(fileListProvider);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult:(didPop, result) {
        debugPrint("${didPop.toString()}");
        if(!didPop){ // 왠진 모르겟는데 뒤로가기 클릭되면 didpop이 false로 나옴
          ref.read(selectModeProvider.notifier).toggleSelectMode();
          ref.read(fileListProvider.notifier).resetFilesSelected();
        }
      } ,
      child: AppBar(
        backgroundColor: backColor,
        title: Text('${countSelectedFiles(fileListState)}개 선택',style: TextStyle(color: textColor,fontSize: 20),),
        leading: IconButton(
          onPressed: () {
            ref.read(selectModeProvider.notifier).toggleSelectMode();
            ref.read(fileListProvider.notifier).resetFilesSelected();
          },
          icon: Icon(Icons.chevron_left,color: textColor,size: 36,),
        ),
      ),
    );
  }
}
