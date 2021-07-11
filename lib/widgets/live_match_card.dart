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
        showLiveBadge(matchModel),
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

Widget showLiveBadge(MatchModel matchModel) {
  var temp = DateTime.now().toUtc();
  var d1 = DateTime.utc(temp.year, temp.month, temp.day);
  var d2 = DateTime.utc(
      int.parse(matchModel.date.substring(0, 4)),
      int.parse(matchModel.date.substring(5, 7)),
      int.parse(matchModel.date.substring(8, 10)));

  var d3 = DateTime.utc(temp.hour, temp.minute, temp.second);
  var d4 = DateTime.utc(
      int.parse(matchModel.date.substring(11, 13)),
      int.parse(matchModel.date.substring(14, 16)),
      int.parse(matchModel.date.substring(17, 19)));
  if (d2.compareTo(d1) == 0 && d3.compareTo(d4) == 0) {
    return Container(
      margin: setMargin(10, 10, 0, 0),
      child: liveBadge(),
    );
  } else {
    return Container();
  }
}
