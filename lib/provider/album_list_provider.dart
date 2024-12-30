import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tag_gallery/models/album.dart';

final albumListProvider = StateNotifierProvider<AlbumListProvider,List<Album>>((ref)=>AlbumListProvider());

class AlbumListProvider extends StateNotifier<List<Album>>{
  AlbumListProvider() : super([]);

  void addAlbum(Album album){
    state = [...state,album];
  }

  void removeAlbum(DateTime createdAt){
    final copyState = [...state];
    copyState.removeWhere((album)=>album.createdAt == createdAt);
    state = copyState;
  }

  void addTag(DateTime createdAt, Set<String> tag){
    final copyState = [...state];
    for(var album in copyState){
      if(album.createdAt == createdAt){
        album.tags!.addAll(tag);
      }
    }
    state = copyState;
  }
  void removeTag(DateTime createdAt, String tag){
    final copyState = [...state];
    for(var album in copyState){
      if(album.createdAt == createdAt){
        album.tags!.remove(tag);
      }
    }
    state = copyState;
  }
}