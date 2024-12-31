import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tag_gallery/common/constant/sort_constant.dart';
import 'package:tag_gallery/models/album.dart';
import 'package:tag_gallery/models/sort_data.dart';

final albumListProvider = StateNotifierProvider<AlbumListProvider, List<Album>>(
    (ref) => AlbumListProvider());

class AlbumListProvider extends StateNotifier<List<Album>> {
  AlbumListProvider() : super([]);

  void sortAlbum(SortData sortData) {
    final copyState = [...state];
    if (sortData.sortType == SortType.date) {
      if (sortData.sortOrder == SortOrder.desc) {
        copyState.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      } else {
        copyState.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      }
    } else {
      if (sortData.sortOrder == SortOrder.desc) {
        copyState.sort((a, b) => b.title.compareTo(a.title));
      } else {
        copyState.sort((a, b) => a.title.compareTo(b.title));
      }
    }
    state = copyState;
  }

  void addAlbum(Album album) {
    state = [...state, album];
  }

  void removeAlbum(DateTime createdAt) {
    final copyState = [...state];
    copyState.removeWhere((album) => album.createdAt == createdAt);
    state = copyState;
  }

  void addTag(DateTime createdAt, Set<String> tag) {
    final copyState = [...state];
    for (var album in copyState) {
      if (album.createdAt == createdAt) {
        album.tags!.addAll(tag);
      }
    }
    state = copyState;
  }

  void removeTag(DateTime createdAt, String tag) {
    final copyState = [...state];
    for (var album in copyState) {
      if (album.createdAt == createdAt) {
        album.tags!.remove(tag);
      }
    }
    state = copyState;
  }
}
