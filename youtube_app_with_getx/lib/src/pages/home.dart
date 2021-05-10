import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/controller/home_controller.dart';
import '../../src/components/video_widget.dart';
import '../components/custom_app_bar.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() => CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  title: CustomAppBar(),
                  floating: true,
                  snap: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            '/detail/${controller.youtubeResult.value.items[index].id.videoId}');
                      },
                      child: VideoWidget(
                          video: controller.youtubeResult.value.items[index]),
                    );
                  },
                      childCount: controller.youtubeResult.value.items == null
                          ? 0
                          : controller.youtubeResult.value.items.length),
                ),
              ],
            )));
  }
}
