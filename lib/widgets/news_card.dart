import 'package:cric_app/features/news/news_model.dart';
import 'package:cric_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

Widget newsCard(BuildContext context, NewsModel newsModel) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: setPadding(10, 10, 10, 10),
    margin: setMargin(15, 10, 15, 0),
    decoration: BoxDecoration(
      color: Colors.black38,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: setMargin(10, 10, 10, 0),
          child: text(newsModel.title!, Colors.white, FontWeight.w600, 17),
        ),
        Container(
          margin: setMargin(10, 5, 0, 0),
          child: Row(
            children: [
              Icon(
                Icons.alarm,
                color: Colors.white38,
                size: 16,
              ),
              Container(
                margin: setMargin(5, 0, 0, 0),
                child: showTime(newsModel),
              ),
            ],
          ),
        ),
        // ignore: unnecessary_null_comparison
        newsModel.urlImage == null
            ? Container(
                margin: setMargin(10, 10, 10, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: imageView(
                      'https://www.unfe.org/wp-content/uploads/2019/04/SM-placeholder-1024x512.png'),
                ),
              )
            : Container(
                margin: setMargin(10, 10, 10, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: imageView(newsModel.urlImage!),
                ),
              ),
      ],
    ),
  );
}

Widget showTime(NewsModel newsModel) {
  var createdDateTime = DateTime.parse(newsModel.publishedAt!);
  var localTime = createdDateTime.toLocal();
  var timeAgo = Jiffy(localTime).fromNow(); // a year ago
  return text(timeAgo, Colors.white38, FontWeight.w600, 14);
}
