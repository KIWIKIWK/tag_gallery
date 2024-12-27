import 'dart:io';

class FileItem{
  final File file;
  bool selected;

  FileItem({required this.file, this.selected = false});
}