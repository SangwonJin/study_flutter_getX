import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../src/controller/video_controller.dart';

class YoutubeDetailController extends GetxController {
  VideoController videoController;
  YoutubePlayerController youtubePlayerController;
  @override
  void onInit() {
    videoController = Get.find(tag: Get.parameters['videoId']);
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: Get.parameters['videoId'],
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));
    print(videoController.video.snippet.title);

    super.onInit();
  }

  String get title => videoController.video.snippet.title;
  String get viewCount => 'Views ${videoController.statistics.value.viewCount}';
  String get publishedTime =>
      DateFormat('yyy-MM-dd').format(videoController.video.snippet.publishedAt);
  String get description => videoController.video.snippet.description;
  String get likeCount => videoController.statistics.value.likeCount;
  String get disLikeCount => videoController.statistics.value.dislikeCount;
  String get youtuberThumbnailUrl => videoController.youtuberThumnailUrl;
  String get youtuberName => videoController.youtuber.value.snippet.title;
  String get subscriberCount =>
      'Subscribers ${videoController.youtuber.value.statistics.subscriberCount}';
}
