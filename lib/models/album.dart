import 'package:tag_gallery/models/file_item.dart';

class Album {
  DateTime createdAt;
  String title;
  Set<String>? tags;
  List<FileItem> files;
  FileItem? thumbnail;

  Album({required this.title,required this.files, Set<String>? tags,})
      : tags = tags ?? {},
        createdAt = DateTime.now(),
        thumbnail = files[0];
}
