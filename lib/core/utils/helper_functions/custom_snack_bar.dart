import 'package:flutter/material.dart';

void showCustomSnackBar({required context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
