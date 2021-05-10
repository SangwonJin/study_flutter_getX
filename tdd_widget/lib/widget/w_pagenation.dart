import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PagenationWidget extends StatefulWidget {
  int totalItemCount;
  int currentPage;

  static const itemCountPerPage = 5;

  PagenationWidget({Key key, this.totalItemCount, this.currentPage})
      : super(key: key);

  @override
  PagenationWidgetState createState() => PagenationWidgetState();
}

@visibleForTesting
class PagenationWidgetState extends State<PagenationWidget> {
  List<num> list;

  @override
  void initState() {
    super.initState();
  }

  get totalPageCount =>
      widget.totalItemCount ~/ PagenationWidget.itemCountPerPage +
      (widget.totalItemCount % PagenationWidget.itemCountPerPage != 0 ? 1 : 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      child: Row(
        children: [
          //화살표 (왼)
          InkWell(
            child: SvgPicture.asset("assets/images/small_arrow_black_left.svg"),
          ),
          //숫자들
          ...list.map((num) => InkWell(
                child: Text(num.toString()),
              )),
          //화살표(오른쪽)
          InkWell(
            child:
                SvgPicture.asset("assets/images/small_arrow_black_right.svg"),
          )
        ],
      ),
      color: Colors.blue,
    );
  }
}
