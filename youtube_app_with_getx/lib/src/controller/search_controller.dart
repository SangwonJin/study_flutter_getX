import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../src/models/youtube_video_result.dart';
import '../../src/repository/youtube_repo.dart';

class YoutubeSearchController extends GetxController {
  SharedPreferences _preferences;
  String key = 'SearchKey';
  ScrollController scrollController = ScrollController();
  RxList<String> history = RxList<String>.empty(growable: true);
  Rx<YoutubeVideoResult> youtubeVideoResult = YoutubeVideoResult(items: []).obs;
  String _currnectKeyword;
  @override
  void onInit() async {
    _event();
    _preferences = await SharedPreferences.getInstance();
    List<dynamic> initData = _preferences.get(key) ?? [];
    history(initData.map((value) => value.toString()).toList());
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeVideoResult.value.nextPageToken != "") {
        print('reload');
        _searchYoutube(_currnectKeyword);
      }
    });
  }

  void submitSearch(String searchData) {
    _currnectKeyword = searchData;
    history.addIf(!history.contains(searchData), searchData);
    _preferences.setStringList(key, history);
    _searchYoutube(searchData);
  }

  void _searchYoutube(String searchData) async {
    YoutubeVideoResult youtubeVideoResultFromServer = await YouTubeRepository.to
        .search(searchData, youtubeVideoResult.value.nextPageToken ?? '');

    if (youtubeVideoResultFromServer != null &&
        youtubeVideoResultFromServer.items != null &&
        youtubeVideoResultFromServer.items.length > 0) {
      youtubeVideoResult.update((youtube) {
        youtube.nextPageToken = youtubeVideoResultFromServer.nextPageToken;
        youtube.items.addAll(youtubeVideoResultFromServer.items);
      });
    }
  }
}


//Set을 이용한 중복데이터 처리
// class YoutubeSearchController extends GetxController {
//   SharedPreferences preferences;
//   String key = 'SearchKey';
//   RxList<String> history = RxList<String>.empty(growable: true);
//   Set<String> originHistory = {};
//   @override
//   void onInit() async {
//     preferences = await SharedPreferences.getInstance();
//     List<dynamic> initData = preferences.get(key) ?? [];
//     originHistory.addAll(initData.map((value) => value.toString()).toList());
//     history(originHistory.toList());
//     super.onInit();
//   }

//   void search(String search) {
//     history.clear();
//     originHistory.add(search);
//     history.addAll(originHistory.toList());
//     preferences.setStringList(key, originHistory.toList());
//   }
// }
