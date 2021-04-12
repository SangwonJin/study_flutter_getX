import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/home.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${Get.parameters["uid"]}'),
          Text('${Get.parameters["name"]}님 안녕하세요'),
          Text('${Get.parameters["age"]}살 입니다.'),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('뒤 페이지 이동'),
          ),
        ],
      )),
    );
  }
}
