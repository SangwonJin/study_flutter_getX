import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  WithGetX({Key key}) : super(key: key);

  Widget _button(String id) {
    return ElevatedButton(
      onPressed: () {
        CountControllerWithGetX.to.increase(id);
      },
      child: Text('+'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('GetX'),
          GetBuilder<CountControllerWithGetX>(
            id: 'firstButton',
            builder: (controller) {
              return Text(
                "${CountControllerWithGetX.to.count}",
                style: TextStyle(fontSize: 30),
              );
            },
          ),
          GetBuilder<CountControllerWithGetX>(
            id: 'secondButton',
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: TextStyle(fontSize: 30),
              );
            },
          ),
          _button('firstButton'),
          SizedBox(
            height: 10,
          ),
          _button('secondButton'),
        ],
      ),
    );
  }
}
