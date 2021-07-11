import 'package:cric_app/AppUrls.dart';
import 'package:cric_app/features/home/match_model.dart';
import 'package:cric_app/utils.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class MatchesService {
  // ignore: close_sinks
  BehaviorSubject<List<MatchModel>> list = BehaviorSubject<List<MatchModel>>();

  List<MatchModel> matchesList = [];

  Future<List<MatchModel>> getMatches() async {
    try {
      var matchList = await fetchMatches();
      matchesList.addAll(matchList);
      list.add(matchesList);
      return matchList;
    } catch (exc) {
      print(exc);
      rethrow;
    }
  }

  Future<List<MatchModel>> fetchMatches() async {
    var dio = Dio();
    final response = await dio.post(AppUrls.getMatches, data: {
      'apikey': api_key,
    });
    print(response.data);
    final body = response.data['matches'] as List;
    return body.map((dynamic json) {
      return MatchModel(
        id: json['id'] as int?,
        date: json['date'] as String?,
        dateGmt: json['dateTimeGMT'] as String?,
        teamOne: json['team-1'] as String?,
        teamTwo: json['team-2'] as String?,
        tossWinnerTeam: json['toss_winner_team'] as String?,
        matchStarted: json['matchStarted'] as bool?,
        type: json['type'] as String?,
        winnerTeam: json['winner_team'] as String?,
      );
    }).toList();
  }

  void refresh() {
    matchesList.clear();
    getMatches();
  }
}
