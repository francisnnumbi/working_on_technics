import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Module2Screen extends StatelessWidget {
  Module2Screen({Key? key}) : super(key: key) {
    initialize();
  }

  final _count = 0.obs;

  initialize() {
    GetStorage().writeIfNull("count", _count.value);
    _count.value = GetStorage().read("count");
    GetStorage().listenKey("count", (value) {
      _count.value = value;
    });
  }

  increment() {
    GetStorage().write("count", GetStorage().read("count") + 1);
  }

  decrement(BuildContext context) {
    if (_count.value > 0) {
      GetStorage().write("count", GetStorage().read("count") - 1);
    } else {
      const snackbar = SnackBar(content: Text("You can't go below 0"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetStorage tutorial'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: increment,
          ),
          const SizedBox(height: 10),
          Obx(() {
            return FloatingActionButton(
              child: const Icon(Icons.remove),
              backgroundColor: (_count.value < 1) ? Colors.grey : Colors.red,
              onPressed: () => decrement(context),
            );
          }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return Text("You've clicked the button ${_count.value} times.",
                  style: Theme.of(context).textTheme.headline5);
            }),
          ],
        ),
      ),
    );
  }
}
