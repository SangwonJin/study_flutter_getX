import 'package:get/get.dart';

enum NUM { FIRST, SECOND }

class User {
  String name;
  int age;
  User(this.name, this.age);
}

class CountControllerWithReactive extends GetxController {
  RxInt count = 0.obs;
  Rx<NUM> nums = NUM.FIRST.obs;
  Rx<User> user = User('sangwon', 33).obs;
  RxList<String> list = [""].obs;

  void increase() {
    count++;
  }

  void putNumber(int num) {
    count(num);
    nums(NUM.SECOND);
    user(User('ran', 31));
    user.update((user) {
      user.name = 'ran';
    });
    list.add('item');
    list.addAll(['asd']);

    list.addIf(user.value.name == "ran", 'ok');
    print(list);
  }

  @override
  void onInit() {
    ever(count, (_) => print("onInit ever() 매번 호출"));
    once(count, (_) => print("onInit once() 한번만 호출"));

    //debounce는 사용자 검색 기능에 자주 사용, 매번 타이핑때마다 DB 통신을하면 DB에 무리를 줌
    debounce(count, (_) => print("onInit debounce() 마지막 변경에 한번만 호출, 1초 후"),
        time: Duration(seconds: 1));

    interval(count, (_) => print("onInit interval() 변경되고 있는 동안 1초마다 호출"),
        time: Duration(seconds: 1));

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
