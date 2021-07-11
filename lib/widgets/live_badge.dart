import 'package:cric_app/utils.dart';
import 'package:flutter/material.dart';

Widget liveBadge() {
  return Container(
    padding: setPadding(8, 3, 8, 3),
    decoration: BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: text('Live', Colors.white, FontWeight.bold, 13),
  );
}
