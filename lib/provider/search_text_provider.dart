import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchTextProvider = StateProvider<String>((ref)=>"");
final albumSearchTypeProvider = StateProvider<String>((ref)=>"title");