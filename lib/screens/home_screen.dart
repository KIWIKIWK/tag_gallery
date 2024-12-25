import 'package:flutter/material.dart';
import 'package:tag_gallery/services/grant_permission.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("테스트 갤러리"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        child: Text("Awd"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await grantPermissions();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
