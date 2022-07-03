import 'package:flutter/material.dart';

class Drifting extends StatelessWidget {
  const Drifting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 253, 235, 215),
      appBar: AppBar(title: const Text('Drifting')),
    );
  }
}
