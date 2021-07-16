import 'package:cric_app/common/show_snackbar.dart';
import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/features/home/match_services.dart';
import 'package:cric_app/features/matchdetail/ui/match_detail_screen.dart';
import 'package:cric_app/features/news/news_model.dart';
import 'package:cric_app/features/news/news_service.dart';
import 'package:cric_app/features/screens/view_all_headlines.dart';
import 'package:cric_app/features/screens/view_all_matches.dart';
import 'package:cric_app/utils.dart';
import 'package:cric_app/widgets/live_match_card.dart';
import 'package:cric_app/widgets/news_card.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  MatchServices matchServices = MatchServices();
  NewsService newsService = NewsService();
  var today = DateTime.now();
  @override
  void initState() {
    var todayDate = today.toString().substring(0, 10);
    matchServices.getMatches(todayDate);
    newsService.getNews(todayDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: appBar('Home', true),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 2),
            () {
              setState(() {
                var todayDate = today.toString().substring(0, 10);
                matchServices.getMatches(todayDate);
                newsService.getNews(todayDate);
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
                margin: setMargin(15, 5, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text('Live / Upcoming Matches', Colors.white70,
                        FontWeight.w600, 18),
                    InkWell(
                      onTap: () {
                        sendToScreen(context, ViewAllMatches());
                      },
                      child:
                          text('View All', Colors.white30, FontWeight.w600, 15),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<List<MatchModel>>(
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
                      child: text('No Live Matches Now. Comeback later',
                          Colors.white, FontWeight.w600, 17),
                    );
                  } else {
                    return Container(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length > 5
                            ? 5
                            : snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              sendToScreen(context,
                                  MatchDetailScreen(snapshot.data![index]));
                            },
                            child: liveMatchCard(snapshot.data![index]),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: setMargin(15, 5, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text('Latest News', Colors.white70, FontWeight.w600, 18),
                    InkWell(
                        onTap: () {
                          sendToScreen(context, ViewAllHeadines());
                        },
                        child: text(
                            'View All', Colors.white30, FontWeight.w600, 15)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<List<NewsModel>>(
                stream: newsService.list,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return Center(
                      child: text('No Latest News Now. Come Back Later',
                          Colors.white, FontWeight.w600, 17),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return newsCard(context, snapshot.data![index]);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
