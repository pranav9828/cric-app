import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/features/home/match_services.dart';
import 'package:cric_app/features/news/news_model.dart';
import 'package:cric_app/features/news/news_service.dart';
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

  @override
  void initState() {
    var today = DateTime.now();
    var todayDate = today.toString().substring(0, 10);
    matchServices.getMatches();
    newsService.getNews(todayDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: appBar('Home', true),
      body: SingleChildScrollView(
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
                  text('View All', Colors.white30, FontWeight.w600, 15),
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
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return Center(
                    child: text('No Live Matches Now. Try later', Colors.white,
                        FontWeight.w600, 17),
                  );
                } else {
                  return Container(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return liveMatchCard(snapshot.data![index]);
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
                  text('View All', Colors.white30, FontWeight.w600, 15),
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
                    child: CircularProgressIndicator(),
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
    );
  }
}
