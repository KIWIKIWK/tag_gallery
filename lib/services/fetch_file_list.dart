import 'dart:io';

import 'package:flutter/material.dart';

import '../models/app_infos.dart';
import '../models/file_item.dart';
import 'fetch_medias.dart';

List<FileItem> fetchFiles() {
  try{
    final List<FileItem> files = [];
    for(var dir in AppInfos.instance.defaultDir){
      final result = fetchMediaFiles(Directory(dir));
      files.addAll(result.map((e)=>FileItem(file: File(e.path))).toList());
    }
    return files;
  } catch (e){
    debugPrint("Error Print : ${e.toString()}");
    return [];
  }
}
