import 'package:cric_app/common/date_formatter.dart';
import 'package:cric_app/common/time_formatter.dart';
import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/features/matchdetail/service/detail_model.dart';
import 'package:cric_app/utils.dart';
import 'package:flutter/material.dart';

Widget showInfoCard(MatchModel matchModel, DetailModel detailModel) {
  return Container(
    margin: setMargin(15, 10, 15, 0),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Container(
      padding: setPadding(9, 9, 9, 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  'Match',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  'Date',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  'Time',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  'Venue',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  'Umpires',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  'Third Umpire',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  'Referee',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  '${matchModel.matchSubtitle}',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  dateFormatter(detailModel.startDate),
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  timeFormatter(detailModel.startDate),
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  '${detailModel.venue}',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  '${detailModel.umpireOne}, ${detailModel.umpireTwo}',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  '${detailModel.umpireTv}',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
              Container(
                margin: setMargin(0, 5, 0, 0),
                child: text(
                  '${detailModel.referee}',
                  Colors.white,
                  FontWeight.normal,
                  14,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
