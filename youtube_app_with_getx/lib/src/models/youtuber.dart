import 'package:youtube_app_with_getx/src/models/statistics.dart';

import '../../src/models/video.dart';

class YouTuber {
  YouTuber({
    this.snippet,
    this.statistics,
  });

  Snippet snippet;
  Statistics statistics;

  factory YouTuber.fromJson(Map<String, dynamic> json) => YouTuber(
        snippet: Snippet.fromJson(json['snippet']),
        statistics: Statistics.fromJson(json['statistics']),
      );
}
