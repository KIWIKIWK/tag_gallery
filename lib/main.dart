import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tag_gallery/view/screens/home_screen.dart';

import 'services/grant_permission.dart';
import 'view/screens/photo_view_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await grantPermissions(); // 앱 시작시 권한 요청
  final bool videosGranted = await Permission.videos.isGranted;
  final bool photosGranted = await Permission.photos.isGranted;
  if (!photosGranted || !videosGranted) {
    // 허용 안할시 앱 종료
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }

  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'photo',
          name: 'photo_view',
          builder: (context, state) => PhotoViewScreen(
            currentIndex: state.extra as int,
          ),
        ),
      ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}
