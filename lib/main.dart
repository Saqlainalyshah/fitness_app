import 'package:fitness_app/screens/forgot_password/otp_received_screen.dart';
import 'package:fitness_app/screens/forgot_password/reset_password_screen.dart';
import 'package:fitness_app/screens/forgot_password/reset_password_successful_Screen.dart';
import 'package:fitness_app/screens/forgot_password/send_otp_screen.dart';
import 'package:fitness_app/screens/home/home_screen.dart';
import 'package:fitness_app/screens/landing_screen/landing_screen.dart';
import 'package:fitness_app/screens/sign_in/sign_in_screen.dart';
import 'package:fitness_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  ));
}
