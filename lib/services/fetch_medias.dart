import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tag_gallery/services/grant_permission.dart';

final List<String> defaultDir = [
  "/storage/emulated/0/Download",
  "/storage/emulated/0/DCIM",
  "/storage/emulated/0/Pictures",
];

final Set<String> supportedFileExtension = {
  '.jpg',
  '.jpeg',
  '.png',
  '.webp',
  '.gif',
  '.mp4',
  '.mov',
  '.avi',
  '.mkv',
  '.webm',// 추가적인 확장자도 여기에 포함
};

Future<List<FileSystemEntity>> fetchMediaFiles(Directory dir) async {
  try {
    await grantPermissions();

    List<FileSystemEntity> allFiles = [];
    List<FileSystemEntity> entities = dir.listSync();
    for (var entity in entities) {
      if (entity is File) {
        allFiles.add(entity);
      } else if (entity is Directory) {
        allFiles.addAll(await fetchMediaFiles(entity));
      }
    }

    // 파일 확장자명 이미지랑 동영상 파일로 필터링
    List<FileSystemEntity> filteredFiles = allFiles.where((file) {
      String path = file.path.toLowerCase();
      return supportedFileExtension.any((ext)=>path.endsWith(ext));
    }).toList();

    return filteredFiles;
  } catch (e) {
    debugPrint("Error granting permissions: $e");
    return [];
  }
}
