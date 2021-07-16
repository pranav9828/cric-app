import 'package:flutter/material.dart';

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Refreshed!'),
    ),
  );
}
