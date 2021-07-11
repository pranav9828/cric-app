import 'package:cric_app/AppUrls.dart';
import 'package:cric_app/features/news/news_model.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class NewsService {
  // ignore: close_sinks
  BehaviorSubject<List<NewsModel>> list = BehaviorSubject<List<NewsModel>>();

  List<NewsModel> newsList = [];

  Future<List<NewsModel>> getNews(String today) async {
    try {
      var nList = await fetchNews(today);
      newsList.addAll(nList);
      list.add(newsList);
      return nList;
    } catch (exc) {
      print(exc);
      rethrow;
    }
  }

  Future<List<NewsModel>> fetchNews(String today) async {
    var dio = Dio();
    final response = await dio.get(AppUrls.cricketNewsUrl +
        'from=' +
        today +
        '&sortBy=popularity&apiKey=c782068751084920bf337c1ddac137dd');
    print(response.data);
    final body = response.data['articles'] as List;
    return body.map((dynamic json) {
      return NewsModel(
        source: json['source']['name'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        urlImage: json['urlToImage'] as String,
        publishedAt: json['publishedAt'] as String,
      );
    }).toList();
  }

  void refresh(String date) {
    newsList.clear();
    getNews(date);
  }
}
