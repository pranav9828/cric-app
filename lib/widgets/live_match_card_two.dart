import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/utils.dart';
import 'package:cric_app/widgets/live_badge.dart';
import 'package:flutter/material.dart';

Widget liveMatchCardTwo(MatchModel matchModel) {
  return Container(
    margin: setMargin(15, 10, 15, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white60,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: setMargin(10, 10, 0, 0),
          child: liveBadge(),
        ),
        Container(
          margin: setMargin(10, 8, 0, 0),
          alignment: Alignment.center,
          child: text('${matchModel.matchTitle} (${matchModel.matchSubtitle})',
              Colors.black45, FontWeight.w600, 13),
        ),
        Container(
          margin: setMargin(0, 7, 0, 0),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              text(matchModel.homeName, Colors.black45, FontWeight.w600, 15),
              text('VS', Colors.black, FontWeight.w600, 15),
              text(matchModel.awayName, Colors.black45, FontWeight.w600, 15),
            ],
          ),
        ),
        Container(
          margin: setMargin(10, 15, 0, 0),
          alignment: Alignment.center,
          child: text(matchModel.venue, Colors.black45, FontWeight.w600, 13),
        ),
        Container(
          margin: setMargin(10, 6, 0, 10),
          alignment: Alignment.center,
          child: text(
              matchModel.result == '' ? 'Yet to Start' : matchModel.result,
              Colors.black45,
              FontWeight.w600,
              13),
        ),
      ],
    ),
  );
}
