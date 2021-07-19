import 'package:cric_app/AppUrls.dart';
import 'package:cric_app/features/media/media_model.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class MediaService {
  // ignore: close_sinks
  BehaviorSubject<List<MediaModel>> list = BehaviorSubject<List<MediaModel>>();

  Future<List<MediaModel>> getVideos() async {
    try {
      var videoList = await fetchVideos();
      list.add(videoList);
      return videoList;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<List<MediaModel>> fetchVideos() async {
    var dio = Dio();
    final response = await dio.get(AppUrls.getCricketVideos);
    print(response.data);
    final body = response.data['data'] as List;
    return body.map((dynamic json) {
      return MediaModel(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        videoUrl: json['videourl'] as String,
        createdAt: json['createdAt'] as String,
      );
    }).toList();
  }
}
