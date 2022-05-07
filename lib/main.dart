import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:working_on_technics/modules/module2/module2_screen.dart';
import 'package:working_on_technics/modules/module4/any_widget.dart';
import 'package:working_on_technics/modules/module4/base_widget.dart';
import 'package:working_on_technics/modules/module5/module5_screen.dart';
import 'package:working_on_technics/modules/module7/module7_screen.dart';

import 'modules/module1/pull_to_refresh.dart';
import 'modules/module3/module3_screen.dart';
import 'modules/module6/module6_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const TestScreen(),
      //home: Module3Screen(),
      // home: BaseWidget(data: "Crazy", child: AnyWidget()),
      home: Module7Screen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<String> ll = <String>["First item", "Second item", "Third item"];
  final PullToRefreshController _controller = PullToRefreshController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() async {
      if (_controller.endPulling) {
        // simulate a long running task
        await Future.delayed(const Duration(seconds: 3));
        setState(() {
          ll.add(DateTime.now().toString());
        });
        _controller.setLoaded();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PullToRefresh(
        // maxHeight: 300,
        controller: _controller,
        child: ListView.builder(
            shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            itemCount: ll.length,
            itemBuilder: (_, idx) {
              return ListTile(
                title: Text(ll[idx]),
              );
            }),
      ),
    );
  }
}
