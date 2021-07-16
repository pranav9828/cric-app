import 'package:cric_app/common/show_snackbar.dart';
import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/features/home/match_services.dart';
import 'package:cric_app/features/matchdetail/ui/match_detail_screen.dart';
import 'package:cric_app/utils.dart';
import 'package:cric_app/widgets/live_match_card_two.dart';
import 'package:flutter/material.dart';

class ViewAllMatches extends StatefulWidget {
  const ViewAllMatches({Key? key}) : super(key: key);

  @override
  _ViewAllMatchesState createState() => _ViewAllMatchesState();
}

class _ViewAllMatchesState extends State<ViewAllMatches> {
  MatchServices matchServices = MatchServices();
  var today = DateTime.now();

  @override
  void initState() {
    var todayDate = today.toString().substring(0, 10);
    matchServices.getMatches(todayDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: appBar('', true),
      body: StreamBuilder<List<MatchModel>>(
        stream: matchServices.list,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          } else if (snapshot.data!.isEmpty) {
            return Container(
              alignment: Alignment.center,
              padding: setMargin(15, 15, 15, 15),
              child: text('No Live Matches Now. Comeback later', Colors.white,
                  FontWeight.w600, 17),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () {
                return Future.delayed(
                  Duration(seconds: 2),
                  () {
                    setState(() {
                      var todayDate = today.toString().substring(0, 10);
                      matchServices.getMatches(todayDate);
                    });
                    showSnackBar(context);
                  },
                );
              },
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      sendToScreen(
                          context, MatchDetailScreen(snapshot.data![index]));
                    },
                    child: liveMatchCardTwo(snapshot.data![index]),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
