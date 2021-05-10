import 'package:get/get.dart';

import '../../src/models/youtuber.dart';
import '../../src/models/statistics.dart';
import '../../src/models/youtube_video_result.dart';

class YouTubeRepository extends GetConnect {
  static YouTubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://www.googleapis.com';
    super.onInit();
  }

  Future loadVideos(String nextPageToken) async {
    String url =
        '/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=5&order=date&type=video&videoDefinition=high&key=AIzaSyBEExWrSHI7ATq8yLuge3XtxuswNue6P_M&pageToken=$nextPageToken';
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future search(String searchKeyword, String nextPageToken) async {
    String url =
        '/youtube/v3/search?part=snippet&maxResults=5&order=date&type=video&videoDefinition=high&key=AIzaSyBEExWrSHI7ATq8yLuge3XtxuswNue6P_M&pageToken=$nextPageToken&q=$searchKeyword';
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future getVideoInfoById(String videoId) async {
    String url =
        '/youtube/v3/videos?part=snippet,statistics&key=AIzaSyBEExWrSHI7ATq8yLuge3XtxuswNue6P_M&id=$videoId';
    try {
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        if (response.body['items'] != null &&
            response.body['items'].length > 0) {
          Map<String, dynamic> data = response.body['items'][0];
          return Statistics.fromJson(data['statistics']);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getYoutuberInfoById(String channelId) async {
    String url =
        '/youtube/v3/channels?part=statistics,snippet&key=AIzaSyBEExWrSHI7ATq8yLuge3XtxuswNue6P_M&id=$channelId';
    try {
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        if (response.body['items'] != null &&
            response.body['items'].length > 0) {
          Map<String, dynamic> data = response.body['items'][0];
          return YouTuber.fromJson(data);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
