import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/count_controller_with_getx.dart';

class BindingPage extends GetView<CountControllerWithGetX> {
  const BindingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('의존성 주입 바인딩'),
      ),
      body: Column(
        children: [
          Obx(
            () => Text(
              controller.count.toString(),
              style: TextStyle(fontSize: 30),
            ),
          ),
          // GetBuilder<CountControllerWithGetX>(
          //     id: 'binding',
          //     builder: (item) {
          //       return Text(
          //         item.count.toString(),
          //         style: TextStyle(fontSize: 30),
          //       );
          //     }),
          ElevatedButton(
            onPressed: () {
              controller.increase('binding');
              // CountControllerWithGetX.to.increase('binding');
            },
            child: Text('바인딩'),
          )
        ],
      ),
    );
  }
}
