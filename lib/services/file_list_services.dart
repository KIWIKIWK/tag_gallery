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

List<FileItem> searchFileItem(List<FileItem> files, String searchTerm) {
  if (searchTerm == "") {
    return files;
  }
  final List<FileItem> searchResult = [];
  for(final file in files){
    if(file.fileName.contains(searchTerm)){
      searchResult.add(file);
    }
  }
  return searchResult;
  // return files.map((file) {
  //   if (file.fileName.contains(searchTerm)) {
  //     return file;
  //   } else {
  //     return null;
  //   }
  // }).toList();
}
