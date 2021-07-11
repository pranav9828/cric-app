import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/utils.dart';
import 'package:cric_app/widgets/live_badge.dart';
import 'package:flutter/material.dart';

Widget matchCard(BuildContext context, MatchModel matchModel) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 200,
    margin: setMargin(0, 15, 15, 0),
    padding: setPadding(12, 12, 12, 12),
    decoration: BoxDecoration(
      color: secondary_color,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: setMargin(0, 0, 15, 0),
              child: showBadge(matchModel),
            ),
          ],
        ),
        Container(
          margin: setMargin(0, 10, 0, 0),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                margin: setMargin(5, 0, 5, 0),
                child: text(
                    matchModel.teamOne!, Colors.white, FontWeight.bold, 15),
              ),
              Container(
                padding: setPadding(7, 3, 7, 3),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: text('vs', Colors.white, FontWeight.normal, 12),
              ),
              Container(
                margin: setMargin(5, 0, 5, 0),
                child: text(
                    matchModel.teamTwo!, Colors.white, FontWeight.bold, 15),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
