import 'package:get/get.dart';
import '../../src/components/youtube_bottom_sheet.dart';

enum RouteName {
  Home,
  Search,
  Add,
  Subscribe,
  Library,
}

class AppController extends GetxService {
  static AppController get to => Get.find();

  RxInt currentIdex = 0.obs;

  void changePageIndex(int index) {
    if (RouteName.values[index] == RouteName.Add) {
      _showBottomSheet();
    } else {
      currentIdex(index);
    }
  }
}

void _showBottomSheet() {
  Get.bottomSheet(YoutubeBottomSheet());
}
