import 'package:get/get.dart';

import '../../src/models/youtuber.dart';
import '../../src/models/statistics.dart';
import '../../src/models/video.dart';
import '../../src/repository/youtube_repo.dart';

class VideoController extends GetxController {
  Video video;
  Rx<Statistics> statistics = Statistics().obs;
  Rx<YouTuber> youtuber = YouTuber().obs;

  VideoController({this.video});

  @override
  void onInit() async {
    Statistics loadedStatistics =
        await YouTubeRepository.to.getVideoInfoById(video.id.videoId);
    statistics(loadedStatistics);

    YouTuber loadedyoutuber =
        await YouTubeRepository.to.getYoutuberInfoById(video.snippet.channelId);
    youtuber(loadedyoutuber);

    super.onInit();
  }

  String get viewCountString => 'Watched ${statistics.value.viewCount ?? '-'}';
  String get youtuberThumnailUrl {
    if (youtuber.value.snippet == null) {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/User_font_awesome.svg/1200px-User_font_awesome.svg.png";
    }
    return youtuber.value.snippet.thumbnails.medium.url;
  }
}
