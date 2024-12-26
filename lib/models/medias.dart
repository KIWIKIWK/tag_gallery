import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:tag_gallery/models/app_infos.dart';
import 'package:tag_gallery/services/fetch_medias.dart';

class Media{
  Media._internal();
  static final Media _instance = Media._internal();
  static Media get instance => _instance;

  final List<File> files = [];

  static init() async{
    await instance.fetchFiles();
  }

  Future<void> fetchFiles() async {
    for(var dir in AppInfos.instance.defaultDir){
      final result = await fetchMediaFiles(Directory(dir));
      files.addAll(result.map((e)=>File(e.path)).toList());
    }
  }
}