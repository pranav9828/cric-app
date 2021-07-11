import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/utils.dart';
import 'package:flutter/material.dart';

Widget showBadge(MatchModel model) {
  DateTime now = new DateTime.now();
  var date = new DateTime(now.year, now.month, now.day);
  var publishedDate = model.dateGmt!.substring(0, 10);
  DateTime dt = DateTime.parse(publishedDate);

  var days = date.difference(dt).inDays;
  if (model.matchStarted == true && days == 0) {
    return Container(
      padding: setPadding(5, 3, 5, 3),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: text('LIVE', Colors.white, FontWeight.normal, 11),
    );
  } else {
    return Container();
  }
}
