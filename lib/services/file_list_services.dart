import 'package:tag_gallery/models/file_item.dart';

int countSelectedFiles(List<FileItem> files) {
  var count = 0;
  for (var file in files) {
    if (file.selected) {
      count++;
    }
  }
  return count;
}

List<FileItem> searchFileItem(List<FileItem> fileList, String searchTerm) {
  final List<FileItem> searchResult = [];
  for(final file in fileList){
    if(file.fileName.contains(searchTerm)){
      searchResult.add(file);
    }
  }
  return searchResult;
}
