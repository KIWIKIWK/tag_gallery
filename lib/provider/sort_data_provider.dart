import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tag_gallery/common/constant/sort_constant.dart';
import 'package:tag_gallery/models/sort_data.dart';
import 'package:tag_gallery/provider/album_list_provider.dart';
import 'package:tag_gallery/provider/file_list_provider.dart';

final sortDataProvider = StateNotifierProvider<SortDataProvider,SortData>((ref)=>SortDataProvider());

class SortDataProvider extends StateNotifier<SortData>{
  SortDataProvider():super(SortData());

  void updateSortType(SortType sortType, WidgetRef ref){
    state = state.copyWith(sortType: sortType);
    ref.read(fileItemListProvider.notifier).sortFileList(state);
    ref.read(albumListProvider.notifier).sortAlbum(state);
  }

  void updateSortOrder(SortOrder sortOrder, WidgetRef ref){
    state = state.copyWith(sortOrder: sortOrder);
    ref.read(fileItemListProvider.notifier).sortFileList(state);
    ref.read(albumListProvider.notifier).sortAlbum(state);
  }
}