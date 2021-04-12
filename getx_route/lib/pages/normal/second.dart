import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screens/home.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('뒤 페이지 이동'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAll(() => HomeScreen());
            },
            child: Text('홈으로 이동'),
          ),
        ],
      )),
    );
  }
}
