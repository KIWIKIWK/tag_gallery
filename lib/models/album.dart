import 'package:tag_gallery/models/file_item.dart';

class Album {
  String title;
  Set<String> tags;
  List<FileItem> files;

  Album({required this.title, Set<String>? tags, List<FileItem>? files})
      : this.tags = tags ?? {},
        this.files = files ?? [];
}
