class AppInfos {
  AppInfos._internal();
  static final AppInfos _instance = AppInfos._internal();

  static AppInfos get instance => _instance;

  final List<String> defaultDir = [
    "/storage/emulated/0/Download",
    "/storage/emulated/0/DCIM",
    "/storage/emulated/0/Pictures",
  ];

  final Set<String> supportedImageExtension = {
    '.jpg',
    '.jpeg',
    '.png',
    '.webp',
    '.gif',
  };

  final Set<String> supportedVideoExtension = {
    '.mp4',
    '.mov',
    '.avi',
    '.mkv',
    '.webm',
  };
}
