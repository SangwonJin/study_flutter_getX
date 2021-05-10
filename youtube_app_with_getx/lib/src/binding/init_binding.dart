import 'package:get/get.dart';
import '../../src/controller/search_controller.dart';
import '../../src/repository/youtube_repo.dart';
import '../controller/app_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YoutubeSearchController());
    Get.put(AppController());
    Get.put(YouTubeRepository(), permanent: true);
  }
}
