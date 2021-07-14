import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/utils.dart';
import 'package:cric_app/widgets/live_badge.dart';
import 'package:flutter/material.dart';

Widget liveMatchCard(MatchModel matchModel) {
  return Container(
    margin: setMargin(15, 10, 15, 0),
    width: 150,
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
          margin: setMargin(0, 15, 0, 0),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              text(
                  matchModel.homeCode.isEmpty
                      ? matchModel.homeName
                      : matchModel.homeCode,
                  Colors.black45,
                  FontWeight.w600,
                  15),
              SizedBox(
                width: 10,
              ),
              text(
                  matchModel.awayCode.isEmpty
                      ? matchModel.awayName
                      : matchModel.awayCode,
                  Colors.black45,
                  FontWeight.w600,
                  15),
            ],
          ),
        ),
        Container(
          margin: setMargin(10, 15, 0, 10),
          alignment: Alignment.center,
          child: text(matchModel.venue, Colors.black45, FontWeight.w600, 13),
        ),
      ],
    ),
  );
}
