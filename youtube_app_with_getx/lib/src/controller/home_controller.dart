import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../src/models/youtube_video_result.dart';
import '../../src/repository/youtube_repo.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _videoLoad();
    _event();
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPageToken != "") {
        print('reload');
        _videoLoad();
      }
    });
  }

  void _videoLoad() async {
    YoutubeVideoResult youtubeVideoResult = await YouTubeRepository.to
        .loadVideos(youtubeResult.value.nextPageToken ?? '');
    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items.length > 0) {
      youtubeResult.update((youtube) {
        youtube.nextPageToken = youtubeVideoResult.nextPageToken;
        youtube.items.addAll(youtubeVideoResult.items);
      });
    }
  }
}
