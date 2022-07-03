import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:working_on_technics/modules/module12/auth_screen.dart';
import 'package:working_on_technics/modules/module13/drifting.dart';

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
      home: Drifting(),
    );
  }
}
