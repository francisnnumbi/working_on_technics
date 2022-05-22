import 'package:flutter/material.dart';
import 'package:working_on_technics/modules/module10/function_caller.dart';
import 'package:working_on_technics/modules/module10/value_changed_caller.dart';
import 'package:working_on_technics/modules/module10/void_caller.dart';

class CallbackTuto extends StatefulWidget {
  const CallbackTuto({Key? key}) : super(key: key);

  @override
  _CallbackTutoState createState() => _CallbackTutoState();
}

class _CallbackTutoState extends State<CallbackTuto> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Callback Tuto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              text,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 20),
            VoidCaller(
              onButtonPressed: () {
                setState(() {
                  text = "Void caller était appelé";
                });
              },
            ),
            const SizedBox(height: 20),
            FunctionCaller(
              onButtonPressed: (val) {
                setState(() {
                  text = "$val";
                });
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ValueChangedCaller(
                onButtonPressed: (val) {
                  setState(() {
                    text = "$val";
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
