import 'dart:io';

class FileItem{
  final File file;
  bool selected;

  FileItem({required this.file, this.selected = false});

  String get fileName => file.path.split('/').last.split('.').first;
  String get fileExtension => file.path.split('.').last;
}