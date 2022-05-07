import 'package:flutter/material.dart';
import 'package:working_on_technics/modules/module4/base_widget.dart';

class AnyWidget extends StatelessWidget {
  const AnyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text('AnyWidget : ${BaseWidget.of(context)}'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Click me'),
            ),
          ],
        ),
      ),
    );
  }
}
