import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../src/pages/library.dart';
import '../src/pages/subscribe.dart';
import '../src/pages/search.dart';
import '../src/pages/home.dart';
import './controller/app_controller.dart';

class App extends GetView<AppController> {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          switch (RouteName.values[controller.currentIdex.value]) {
            case RouteName.Home:
              return Home();
              break;
            case RouteName.Search:
              return YoutubeSearch();
              break;
            case RouteName.Add:
              return null;
              break;
            case RouteName.Subscribe:
              return Subscribe();
              break;
            case RouteName.Library:
              return Library();
              break;
          }
          return Container();
        }),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIdex.value,
              showSelectedLabels: true,
              selectedItemColor: Colors.black,
              onTap: controller.changePageIndex,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svg/icons/home_off.svg',
                      width: 22,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/icons/home_on.svg',
                      width: 22,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svg/icons/compass_off.svg',
                      width: 22,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/icons/compass_on.svg',
                      width: 22,
                    ),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SvgPicture.asset(
                        'assets/svg/icons/plus.svg',
                        width: 30,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svg/icons/subs_off.svg',
                      width: 22,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/icons/subs_on.svg',
                      width: 22,
                    ),
                    label: "Subscribe"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svg/icons/library_off.svg',
                      width: 22,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/icons/library_on.svg',
                      width: 22,
                    ),
                    label: "library"),
              ],
            )));
  }
}
