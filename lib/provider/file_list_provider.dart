import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  }

  void toggleFileSelected(int index) {
    final copyState = [...state];
    copyState[index].selected = !copyState[index].selected;
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
