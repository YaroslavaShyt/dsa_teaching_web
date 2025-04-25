import 'package:flutter/material.dart';

import 'error_screen.dart';

class ErrorFactory {
  static Widget build(VoidCallback onTap) {
    return ErrorScreen(
      onTap: onTap,
    );
  }
}
