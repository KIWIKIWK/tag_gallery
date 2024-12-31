import '../models/album.dart';
import '../models/file_item.dart';

List<FileItem> searchFileItem(List<FileItem> fileList, String searchTerm) {
  final List<FileItem> searchResult = [];
  for(final file in fileList){
    if(file.fileName.contains(searchTerm)){
      searchResult.add(file);
    }
  }
  return searchResult;
}

List<Album> searchAlbumItem(List<Album> albumList, String searchTerm, String searchType){
  final List<Album> searchResult = [];
  if(searchType == 'title'){
    for(final album in albumList){
      if(album.title.contains(searchTerm)){
        searchResult.add(album);
      }
    }
  }else{
    for(final album in albumList){
      if(album.tags != null){
        for(final tag in album.tags!){
          if(tag.contains(searchTerm)){
            searchResult.add(album);
            break;
          }
        }
      }
    }
  }
  return searchResult;
}