import 'package:cric_app/common/tabs.dart';
import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:cric_app/features/matchdetail/ui/info_tab_screen.dart';
import 'package:cric_app/features/matchdetail/ui/insights_tab_screen.dart';
import 'package:cric_app/features/matchdetail/ui/live_tab_screen.dart';
import 'package:cric_app/features/matchdetail/ui/scorecard_tab_screen.dart';

// ignore: must_be_immutable
class MatchDetailScreen extends StatefulWidget {
  MatchModel? matchModel;
  MatchDetailScreen(this.matchModel);
  @override
  _MatchDetailScreenState createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          elevation: 1.0,
          title: text(
              '${widget.matchModel!.homeName} vs ${widget.matchModel!.awayName}',
              Colors.white,
              FontWeight.bold,
              20),
          centerTitle: true,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: [
            InfoTabScreen(widget.matchModel),
            LiveTabScreen(widget.matchModel),
            ScorecardTabScreen(),
            InsightsTabScreen(),
          ],
        ),
      ),
    );
  }
}
