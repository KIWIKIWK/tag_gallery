import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/file_list.dart';
import '../services/fetch_file_list.dart';

final fileListProvider = StateNotifierProvider<FileListProvider, List<FileItem>>((ref){
  final initialFiles = fetchFiles(); // 초기 파일을 가져오는 메서드 호출
  return FileListProvider(initialFiles);
});
final selectModeProvider = StateNotifierProvider<SelectModeProvider,bool>((ref)=>SelectModeProvider());

class FileListProvider extends StateNotifier<List<FileItem>>{
  FileListProvider(List<FileItem> initialFiles) : super(initialFiles);

  void fetchFileList() {
    state = fetchFiles();
  }

  void toggleFileSelected(int index){
    final copyState = [...state];
    copyState[index].selected = !copyState[index].selected;
    state = copyState;
  }

  void resetFilesSelected(){
    final copyState = [...state];
    for(var file in copyState){
      file.selected = false;
    }
    state = copyState;
  }
}

class SelectModeProvider extends StateNotifier<bool>{
  SelectModeProvider() : super(false);
  void toggleSelectMode(){
    state = !state;
  }
}