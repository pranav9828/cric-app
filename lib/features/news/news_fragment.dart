import 'package:cric_app/features/news/news_detail.dart';
import 'package:cric_app/features/news/news_model.dart';
import 'package:cric_app/features/news/news_service.dart';
import 'package:cric_app/utils.dart';
import 'package:cric_app/widgets/news_card.dart';
import 'package:flutter/material.dart';

class NewsFragment extends StatefulWidget {
  @override
  _NewsFragmentState createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  NewsService newsService = NewsService();
  var todayDateTime = DateTime.now();

  @override
  void initState() {
    var todayDate = todayDateTime.toString().substring(0, 10);
    newsService.getNews(todayDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: appBar('News', true),
      body: StreamBuilder<List<NewsModel>>(
        stream: newsService.list,
        initialData: null,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: text('No News Found. Come back later.', Colors.white,
                  FontWeight.bold, 16),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () {
                return Future.delayed(
                  Duration(seconds: 2),
                  () {
                    setState(() {
                      var todayDate = todayDateTime.toString().substring(0, 10);
                      newsService.refresh(todayDate);
                    });

                    // showing snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Page Refreshed.'),
                      ),
                    );
                  },
                );
              },
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      sendToScreen(
                          context, NewsDetail(snapshot.data![index].url!));
                    },
                    child: newsCard(context, snapshot.data![index]),
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
