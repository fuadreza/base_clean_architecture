
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}