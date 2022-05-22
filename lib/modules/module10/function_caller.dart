import 'package:flutter/material.dart';

class FunctionCaller extends StatelessWidget {
  FunctionCaller({Key? key, required this.onButtonPressed}) : super(key: key);
  final Function(String) onButtonPressed;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Entrer une valeur',
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            onButtonPressed(_controller.text);
            print("Function caller");
          },
          child: const Text('Function callback click'),
        ),
      ],
    );
  }
}
