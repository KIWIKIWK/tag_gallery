import 'package:flutter_riverpod/flutter_riverpod.dart';

final navIndexProvider = StateNotifierProvider<NavIndexProvider,int>((ref)=>NavIndexProvider());

class NavIndexProvider extends StateNotifier<int>{
  NavIndexProvider() : super(0);

  void setNavIndex(int index){
    state = index;
  }
}