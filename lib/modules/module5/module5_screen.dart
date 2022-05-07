import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Module5Screen extends StatefulWidget {
  const Module5Screen({Key? key}) : super(key: key);

  @override
  _Module5ScreenState createState() => _Module5ScreenState();
}

class _Module5ScreenState extends State<Module5Screen> {
  var _cWidth = 200.0.obs;
  var _cHeight = 400.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 5'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Obx(() {
              return AnimatedContainer(
                height: _cHeight.value,
                width: _cWidth.value,
                color: Colors.red,
                curve: Curves.easeInOutQuint,
                duration: const Duration(milliseconds: 1000),
              );
            }),
            const SizedBox(height: 20),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  double d = _cWidth.value;
                  _cWidth.value = _cHeight.value;
                  _cHeight.value = d;
                },
                child: const Text('Change width')),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
