import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:working_on_technics/modules/module12/auth_screen.dart';

import 'modules/module1/pull_to_refresh.dart';
import 'modules/module11/pdf_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final PdfController pc = Get.put(PdfController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      // home: const TestScreen(),
      //home: Module3Screen(),
      // home: BaseWidget(data: "Crazy", child: AnyWidget()),
      home: AuthScreen(),
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
