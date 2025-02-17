import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupScreenCheckBoxProvider=StateProvider<bool>((ref)=>false);
final signUpScreenGenderTypeProvider=StateProvider<String>((ref)=>'');
final signUpScreenGenderIndexProvider=StateProvider<int>((ref)=>0);
final signUpScreenIsColorProvider=StateProvider<bool>((ref)=>false);
final signUpScreenIsSelectedProvider=StateProvider<bool>((ref)=>false);