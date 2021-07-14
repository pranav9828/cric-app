import 'package:cric_app/AppUrls.dart';
import 'package:cric_app/features/home/match_model.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class MatchServices {
  // ignore: close_sinks
  BehaviorSubject<List<MatchModel>> list = BehaviorSubject<List<MatchModel>>();
  List<MatchModel> matchList = [];

  Future<List<MatchModel>> getMatches(String date) async {
    try {
      var nList = await fetchMatches(date);
      matchList.addAll(nList);
      list.add(matchList);
      return nList;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<List<MatchModel>> fetchMatches(String date) async {
    var dio = Dio();
    dio.options.headers['x-rapidapi-key'] =
        '7f67623d5fmshbd6898214e6510ap13eddfjsne4c5b6090102';
    dio.options.headers['x-rapidapi-host'] = 'cricket-live-data.p.rapidapi.com';
    final response = await dio.get(AppUrls.getMatches + date);
    print(response.data);
    final body = response.data['results'] as List;
    return body.map((dynamic json) {
      return MatchModel(
        id: json['id'] as int,
        seriesId: json['series_id'] as int,
        venue: json['venue'] as String,
        date: json['date'] as String,
        status: json['status'] as String,
        result: json['result'] as String,
        matchTitle: json['match_title'] as String,
        matchSubtitle: json['match_subtitle'] as String,
        homeId: json['home']['id'] as int,
        homeName: json['home']['name'] as String,
        homeCode: json['home']['code'] as String,
        awayId: json['away']['id'] as int,
        awayName: json['away']['name'] as String,
        awayCode: json['away']['code'] as String,
      );
    }).toList();
  }
}
