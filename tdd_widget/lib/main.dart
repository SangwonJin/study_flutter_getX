import 'package:flutter/material.dart';

import 'package:tdd_widget/network/mock_api.dart';
import 'package:tdd_widget/widget/w_pagenation.dart';
import 'package:tdd_widget/widget/w_pagenation_complete.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Test-Driven Widget Development'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MockRepository repository = MockRepository();
  List<num> list;
  int currentPage = 1;
  int totalCount = 0;
  bool isLoading = false;
  static const int limit = 5;
  @override
  void initState() {
    super.initState();

    requesetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
                duration: Duration(milliseconds: 300),
                color: isLoading
                    ? Colors.grey.withOpacity(0.5)
                    : Colors.transparent,
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Container()),
            list == null
                ? Container()
                : Container(
                    height: 350,
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              ...(list
                                  .map((item) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                              item.toString(),
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ),
                                        ],
                                      ))
                                  .toList())
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            PagenationWidget(),
                          ],
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void requesetData() async {
    setState(() {
      isLoading = true;
    });
    final response = await repository.getNumbers(currentPage, limit);
    setState(() {
      isLoading = false;
      list = response.numList;
      totalCount = response.totalCount;
    });
  }
}
