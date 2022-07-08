import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:working_on_technics/modules/module13/hiving.dart';

import 'modules/module11/pdf_controller.dart';
import 'modules/module13/hiving.dart';
import 'modules/module13/models/address/address.dart';
import 'modules/module13/models/person/person.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(PersonAdapter());
  //await Hive.openBox("contacts");
  await Hive.openBox<Person>('contacts');
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
      home: Hiving(),
    );
  }
}
