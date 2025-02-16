import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final landingPageIndex=StateProvider<int>((ref)=>0);
final landingPageControllerProvider = StateProvider<PageController>((ref)=>PageController());