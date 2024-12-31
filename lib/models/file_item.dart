import 'dart:io';

class FileItem{
  final File file;
  bool selected;

  FileItem({required this.file, this.selected = false});

  String get fileName => file.path.split('/').last.split('.').first;
  String get fileExtension => file.path.split('.').last;
  String get filePath{
    final split = file.path.split('/');
    split.removeLast();
    return "${split.join('/')}/";
  }
  DateTime get modifiedDate => file.lastModifiedSync();
  String get fileSize{
    final byteSize = file.statSync().size;
    final kByteSize = (byteSize / 1024).roundToDouble();

    return "${kByteSize}KB";
  }
  String get contractionFileName => fileName.length > 15 ? "${fileName.substring(0,15).trim()}..." : fileName;
}