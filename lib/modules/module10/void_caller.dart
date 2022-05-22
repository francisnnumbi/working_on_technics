import 'package:flutter/material.dart';

class VoidCaller extends StatelessWidget {
  VoidCaller({Key? key, required this.onButtonPressed}) : super(key: key);
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onButtonPressed();
        print("Void caller");
      },
      child: const Text('Void callback click'),
    );
  }
}
