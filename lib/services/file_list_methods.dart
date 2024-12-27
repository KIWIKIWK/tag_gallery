import 'package:tag_gallery/models/file_list.dart';

int countSelectedFiles(List<FileItem> files){
  var count = 0;
  for(var file in files){
    if(file.selected){
      count++;
    }
  }
  return count;
}