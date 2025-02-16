import 'package:fitness_app/screens/forgot_password/otp_received_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:async';

class CountdownNotifier extends StateNotifier<int> {
  CountdownNotifier() : super(60) {
    _startCountdown();
  }

  void _startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--; // Decrease the counter by 1 every second
      } else {
        timer.cancel(); // Stop when reaching 0
      }
    });
  }
  void restartCountdown() {
    state = 56; // Reset to initial value
    _startCountdown();
  }
}

final countdownProvider = StateNotifierProvider<CountdownNotifier, int>(
      (ref) => CountdownNotifier(),
);
