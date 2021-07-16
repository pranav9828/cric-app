import 'package:cric_app/AppUrls.dart';
import 'package:cric_app/features/matchdetail/service/dismissal_model.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class InningsHistoryService {
  // ignore: close_sinks
  BehaviorSubject<List<DismissalModel>> list =
      BehaviorSubject<List<DismissalModel>>();
  List<DismissalModel> ballsList = [];

  Future<List<DismissalModel>> getBalls(String matchId) async {
    try {
      var nList = await fetchBalls(matchId);
      ballsList.addAll(nList);
      list.add(ballsList);
      return nList;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<List<DismissalModel>> fetchBalls(String matchId) async {
    var dio = Dio();
    dio.options.headers['x-rapidapi-key'] =
        '7f67623d5fmshbd6898214e6510ap13eddfjsne4c5b6090102';
    dio.options.headers['x-rapidapi-host'] = 'cricket-live-data.p.rapidapi.com';
    final response = await dio.get(AppUrls.getMatchDetails + matchId);
    print(response.data);
    final body = response.data['results']['live_details']['stats']
        ['last_18_balls'] as List;
    return body.map((dynamic json) {
      return DismissalModel(
        isDismissal: json['isDismissal'] as bool,
        isBoundary: json['isBoundary'] as bool,
        isWide: json['isWide'] as bool,
        isMaiden: json['isMaiden'] as bool,
        isNoBall: json['isNoBall'] as bool,
        isBye: json['isBye'] as bool,
        isLegBye: json['isLegBye'] as bool,
        isOverEnd: json['isOverEnd'] as bool,
        currentOver: json['currentOver'] as int,
        runs: json['runs'] as int,
        currentOverBall: json['currentOverBall'] as int,
      );
    }).toList();
  }

  void reset(String matchId) {
    ballsList.clear();
    getBalls(matchId);
  }
}
