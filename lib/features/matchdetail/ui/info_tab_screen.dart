import 'package:cric_app/common/show_snackbar.dart';
import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/features/matchdetail/service/detail_model.dart';
import 'package:cric_app/features/matchdetail/service/match_detail_service.dart';
import 'package:cric_app/utils.dart';
import 'package:cric_app/widgets/info_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoTabScreen extends StatefulWidget {
  MatchModel? matchModel;
  InfoTabScreen(this.matchModel);
  @override
  _InfoTabScreenState createState() => _InfoTabScreenState();
}

class _InfoTabScreenState extends State<InfoTabScreen> {
  MatchDetailService matchDetailService = MatchDetailService();
  @override
  void initState() {
    matchDetailService.getMatchDetails(widget.matchModel!.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DetailModel>(
      initialData: null,
      stream: matchDetailService.data,
      builder: (context, snapshot) {
        // ignore: unnecessary_null_comparison
        if (snapshot.data == null) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.grey,
          ));
        } else
          return RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                Duration(seconds: 2),
                () {
                  setState(() {
                    matchDetailService
                        .getMatchDetails(widget.matchModel!.id.toString());
                  });
                  showSnackBar(context);
                },
              );
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: setMargin(15, 15, 15, 0),
                    child: text('INFO', Colors.white, FontWeight.bold, 16),
                  ),
                  showInfoCard(widget.matchModel!, snapshot.data!),
                  Container(
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
                                'Toss',
                                Colors.white,
                                FontWeight.normal,
                                14,
                              ),
                            ),
                            Container(
                              margin: setMargin(0, 5, 0, 0),
                              child: text(
                                'Status',
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
                                '${snapshot.data!.toss}',
                                Colors.white,
                                FontWeight.normal,
                                14,
                              ),
                            ),
                            Container(
                              margin: setMargin(0, 5, 0, 0),
                              child: text(
                                '${snapshot.data!.status}',
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
                ],
              ),
            ),
          );
      },
    );
  }
}
