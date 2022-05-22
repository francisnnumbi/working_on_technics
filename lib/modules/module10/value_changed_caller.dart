import 'package:flutter/material.dart';

class ValueChangedCaller extends StatefulWidget {
  ValueChangedCaller({Key? key, required this.onButtonPressed})
      : super(key: key);
  final ValueChanged<String> onButtonPressed;

  @override
  State<ValueChangedCaller> createState() => _ValueChangedCallerState();
}

class _ValueChangedCallerState extends State<ValueChangedCaller> {
  final TextEditingController _controller = TextEditingController();
  bool thinking = false;
  String buttontext = "Go";

  _workInBackground() async {
    setState(() {
      thinking = true;
    });
    await Future.delayed(const Duration(seconds: 5), () {
      widget.onButtonPressed(_controller.text);
      setState(() {
        thinking = false;
        buttontext = "Fait";
      });
    });
    await Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        buttontext = "Go";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Entrer une valeur',
                ),
              ),
            ),
            const SizedBox(width: 5),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: ElevatedButton(
                onPressed: () {
                  _workInBackground();
                  print("Function caller");
                },
                child: Text(buttontext),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        if (thinking) const LinearProgressIndicator(),
      ],
    );
  }
}
