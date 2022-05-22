import 'package:flutter/material.dart';

class WhateverScreen extends StatelessWidget {
  WhateverScreen({Key? key, required this.callBack}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final ValueChanged<String> callBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                //     hintText: "Type something",
                labelText: "Type something",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                // print(controller.text);
                callBack(controller.text);
              },
              child: const Text('Send up')),
        ],
      ),
    );
  }
}
