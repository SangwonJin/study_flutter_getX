import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './binding/binding_page.dart';
import './pages/binding_page.dart';
import './pages/user.dart';
import './pages/next.dart';
import './pages/named/first.dart';
import './pages/named/second.dart';
import './screens/home.dart';
import './controller/count_controller_with_getx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/first',
          page: () => FirstNamedPage(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/second',
          page: () => SecondNamedPage(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/next',
          page: () => NextPage(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/user/:uid',
          page: () => UserPage(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/binding', //BindingPage안에 이미 obs 사용하기때문에 바로 객체화 됨
          page: () => BindingPage(),
          transition: Transition.leftToRight,
          binding: BindingsBuilder(() {
            Get.lazyPut<CountControllerWithGetX>(
                () => (CountControllerWithGetX()));
          }),
        ),
        GetPage(
          name: '/binding2',
          page: () => BindingPage(),
          transition: Transition.leftToRight,
          binding: BindingPageBinding(),
        ),
      ],
    );
  }
}
