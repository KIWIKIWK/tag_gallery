import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tag_gallery/models/sort_data.dart';
import '../common/constant/sort_constant.dart';
import '../models/file_item.dart';
import '../services/fetch_file_list.dart';

final fileItemListProvider =
    StateNotifierProvider<FileItemListProvider, List<FileItem>>((ref) {
  final initialFiles = fetchFiles(); // 초기 파일을 가져오는 메서드 호출
  return FileItemListProvider(initialFiles);
});
final selectModeProvider = StateNotifierProvider<SelectModeProvider, bool>(
    (ref) => SelectModeProvider());

class FileItemListProvider extends StateNotifier<List<FileItem>> {
  FileItemListProvider(List<FileItem> initialFiles) : super(initialFiles);

  void fetchFileList() {
    state = fetchFiles();
    sortFileList(SortData());
  }

  void sortFileList(SortData sortData) {
    final copyState = [...state];
    if (sortData.sortType == SortType.date) {
      if (sortData.sortOrder == SortOrder.desc) {
        copyState.sort((a, b) => b.modifiedDate.compareTo(a.modifiedDate));
      } else {
        copyState.sort((a, b) => a.modifiedDate.compareTo(b.modifiedDate));
      }
    } else {
      if (sortData.sortOrder == SortOrder.desc) {
        copyState.sort((a, b) => b.fileName.compareTo(a.fileName));
      } else {
        copyState.sort((a, b) => a.fileName.compareTo(b.fileName));
      }
    }
    state = copyState;
  }

  void toggleFileSelected(FileItem fileItem) {
    final copyState = [...state];
    for(var file in copyState){
      if(file == fileItem){
        file.selected = !file.selected;
      }
    }
    state = copyState;
  }

  void selectAllFile(){
    final copyState = [...state];
    for(var file in copyState){
      file.selected = true;
    }
    state = copyState;
  }

  void resetFilesSelected() {
    final copyState = [...state];
    for (var file in copyState) {
      file.selected = false;
    }
    state = copyState;
  }
}

class SelectModeProvider extends StateNotifier<bool> {
  SelectModeProvider() : super(false);

  void toggleSelectMode() {
    state = !state;
  }
}
