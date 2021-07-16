import 'package:cric_app/common/show_snackbar.dart';
import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/features/matchdetail/service/detail_model.dart';
import 'package:cric_app/features/matchdetail/service/dismissal_model.dart';
import 'package:cric_app/features/matchdetail/service/innings_history_service.dart';
import 'package:cric_app/features/matchdetail/service/match_detail_service.dart';
import 'package:cric_app/utils.dart';
import 'package:cric_app/widgets/show_loader.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LiveTabScreen extends StatefulWidget {
  MatchModel? matchModel;
  LiveTabScreen(this.matchModel);

  @override
  _LiveTabScreenState createState() => _LiveTabScreenState();
}

class _LiveTabScreenState extends State<LiveTabScreen> {
  MatchDetailService matchDetailService = MatchDetailService();
  InningsHistoryService inningsHistoryService = InningsHistoryService();
  @override
  void initState() {
    matchDetailService.getMatchDetails(widget.matchModel!.id.toString());
    inningsHistoryService.getBalls(widget.matchModel!.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          Duration(seconds: 2),
          () {
            setState(() {
              matchDetailService
                  .getMatchDetails(widget.matchModel!.id.toString());
              inningsHistoryService.reset(widget.matchModel!.id.toString());
            });
            showSnackBar(context);
          },
        );
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            StreamBuilder<DetailModel>(
              stream: matchDetailService.data,
              initialData: null,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return showLoader();
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: setMargin(15, 15, 15, 0),
                                child: text(snapshot.data!.title, Colors.white,
                                    FontWeight.bold, 16),
                              ),
                              Container(
                                margin: setMargin(15, 5, 15, 0),
                                child: text(
                                    '${snapshot.data!.runs}/${snapshot.data!.wickets} (${snapshot.data!.overs})',
                                    Colors.white,
                                    FontWeight.bold,
                                    16),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: setMargin(15, 15, 15, 0),
                                child: text(
                                    'CRR', Colors.white, FontWeight.bold, 16),
                              ),
                              Container(
                                margin: setMargin(15, 5, 15, 0),
                                child: text('${snapshot.data!.currentRunRate}',
                                    Colors.white, FontWeight.bold, 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: setMargin(15, 15, 15, 0),
                        child: text(snapshot.data!.toss, Colors.white,
                            FontWeight.bold, 14),
                      ),
                      Container(
                        margin: setMargin(15, 15, 15, 0),
                        child: text('FOW: ${snapshot.data!.fow}', Colors.white,
                            FontWeight.bold, 14),
                      ),
                    ],
                  );
                }
              },
            ),
            Container(
              margin: setMargin(15, 20, 15, 0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: setMargin(15, 10, 15, 0),
                    child: text(
                        'Ball Tracking', Colors.white, FontWeight.normal, 17),
                  ),
                  StreamBuilder<List<DismissalModel>>(
                      stream: inningsHistoryService.list,
                      initialData: null,
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return showLoader();
                        } else if (snapshot.data!.isEmpty) {
                          return Center(
                            child: text(
                              'No data',
                              Colors.white,
                              FontWeight.normal,
                              15,
                            ),
                          );
                        } else {
                          return Container(
                            height: 130,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: setPadding(10, 10, 10, 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: text(
                                            '${snapshot.data![index].currentOver}.${snapshot.data![index].currentOverBall}',
                                            Colors.white,
                                            FontWeight.normal,
                                            14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: setPadding(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: text(
                                          showTracking(snapshot.data![index]),
                                          secondaryColor,
                                          FontWeight.bold,
                                          13,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String showTracking(DismissalModel dismissalModel) {
    if (dismissalModel.isBoundary) {
      return '4';
    } else if (dismissalModel.isBye) {
      return 'B';
    } else if (dismissalModel.isDismissal) {
      return 'W';
    } else if (dismissalModel.isLegBye) {
      return 'LB';
    } else if (dismissalModel.isMaiden) {
      return '.';
    } else if (dismissalModel.isNoBall) {
      return 'NB';
    } else if (dismissalModel.isWide) {
      return 'WD';
    } else {
      return dismissalModel.runs.toString();
    }
  }
}
