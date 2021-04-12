import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/count_controller_with_reactive_getX.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithReactive());
    return Scaffold(
      appBar: AppBar(
        title: Text('단순상태 관리'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Reactive GetX'),
          Obx(() =>
              Text('${Get.find<CountControllerWithReactive>().count.value}')),
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerWithReactive>().increase();
            },
            child: Text('+'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerWithReactive>().putNumber(5);
            },
            child: Text('5로 변경'),
          ),
        ],
      )),
    );
  }
}
