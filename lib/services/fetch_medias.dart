import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tag_gallery/models/app_infos.dart';
import 'package:tag_gallery/services/grant_permission.dart';

Future<List<FileSystemEntity>> fetchMediaFiles(Directory dir) async {
  try {
    await grantPermissions();
    final AppInfos appInfos = AppInfos.instance;
    final Set<String> supportedMediaExtension = {
      ...appInfos.supportedVideoExtension,
      ...appInfos.supportedImageExtension
    };

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
      return supportedMediaExtension.any((ext) => path.endsWith(ext));
    }).toList();

    return filteredFiles;
  } catch (e) {
    debugPrint("Error granting permissions: $e");
    return [];
  }
}
