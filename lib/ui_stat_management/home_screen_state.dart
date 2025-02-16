import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenIsPlayedProvider=StateProvider<bool>((ref)=>false);

final homeScreenProgressValueProvider=StateProvider<String>((ref)=>ref.watch(homeScreenProgressListProvider)[0]);
final homeScreenProgressListProvider=StateProvider<List<String>>((ref)=>['This Week', 'This Month','This Year']);