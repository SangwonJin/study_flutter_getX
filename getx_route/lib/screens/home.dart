import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/dependencies/dependency_manage_page.dart';
import '../pages/reactive_state_manage_page.dart';
import '../pages/simple_state_manage.dart';
import '../pages/normal/first.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('getX 라이팅'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => FirstPage()));
            },
            child: Text('일반적인 라우팅'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => FirstPage());
            },
            child: Text('getX 라우팅'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/first");
            },
            child: Text('first Named page'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/next", arguments: User('Sangwon', 33));
            },
            child: Text('Arguments 전달'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(
                "/user/222?name=상원&age=22",
              );
            },
            child: Text('동적 URL'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => SimpleStateManagePage());
            },
            child: Text('단순상태관리'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => ReactiveStateManagePage());
            },
            child: Text('반응형 상태관리'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => DependencyManagePage());
            },
            child: Text('의존성 관리'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/binding");
            },
            child: Text('바인딩'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/binding2");
            },
            child: Text('바인딩 페이지 바인딩'),
          ),
        ],
      )),
    );
  }
}

class User {
  String name;
  int age;
  User(this.name, this.age);
}
