import 'package:cric_app/AppUrls.dart';
import 'package:cric_app/features/matchdetail/service/detail_model.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class MatchDetailService {
  // ignore: close_sinks
  BehaviorSubject<DetailModel> data = BehaviorSubject<DetailModel>();

  Future<DetailModel> getMatchDetails(String matchId) async {
    try {
      var nList = await fetchMatchDetails(matchId);
      data.add(nList);
      return nList;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<DetailModel> fetchMatchDetails(String matchId) async {
    var dio = Dio();
    dio.options.headers['x-rapidapi-key'] =
        '7f67623d5fmshbd6898214e6510ap13eddfjsne4c5b6090102';
    dio.options.headers['x-rapidapi-host'] = 'cricket-live-data.p.rapidapi.com';
    final response = await dio.get(AppUrls.getMatchDetails + matchId);
    print(response.data);
    Map<String, dynamic> json = response.data['results'];
    return DetailModel(
      id: json['fixture']['id'] as int,
      seriesId: json['fixture']['series_id'] as int,
      matchTitle: json['fixture']['match_title'] as String,
      venue: json['fixture']['venue'] as String,
      startDate: json['fixture']['start_date'] as String,
      endDate: json['fixture']['end_date'] as String,
      homeId: json['fixture']['home']['id'] as int,
      homeName: json['fixture']['home']['name'] as String,
      homeCode: json['fixture']['home']['code'] as String,
      awayId: json['fixture']['away']['id'] as int,
      awayName: json['fixture']['away']['name'] as String,
      awayCode: json['fixture']['away']['code'] as String,
      umpireOne: json['live_details']['officials']['umpire_1'] as String,
      umpireTwo: json['live_details']['officials']['umpire_2'] as String,
      umpireTv: json['live_details']['officials']['umpire_tv'] as String,
      referee: json['live_details']['officials']['referee'] as String,
      umpireReserve:
          json['live_details']['officials']['umpire_reserve'] as String,
      awayScores:
          json['live_details']['match_summary']['away_scores'] as String,
      homeScores:
          json['live_details']['match_summary']['home_scores'] as String,
      inPlay: json['live_details']['match_summary']['in_play'] as String,
      result: json['live_details']['match_summary']['result'] as String,
      status: json['live_details']['match_summary']['status'] as String,
      toss: json['live_details']['match_summary']['toss'] as String,
      inningsNumber:
          json['live_details']['scorecard'][0]['innings_number'] as int,
      current: json['live_details']['scorecard'][0]['current'] as bool,
      title: json['live_details']['scorecard'][0]['title'] as String,
      overs: json['live_details']['scorecard'][0]['overs'] as String,
      runs: json['live_details']['scorecard'][0]['runs'] as int,
      wickets: json['live_details']['scorecard'][0]['wickets'] as String,
      extras: json['live_details']['scorecard'][0]['extras'] as int,
      fow: json['live_details']['scorecard'][0]['fow'] as String,
      currentRunRate:
          json['live_details']['stats']['current_run_rate'] as String,
    );
  }
}
